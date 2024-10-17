resource "helm_release" "karpenter" {
  count            = var.karpenter_toggle ? 1 : 0
  namespace        = "karpenter"
  create_namespace = true

  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "1.0.5"

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.karpenter_role[count.index].arn
  }

  set {
    name  = "settings.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "settings.clusterEndpoint"
    value = aws_eks_cluster.main.endpoint
  }

  set {
    name  = "settings.interruptionQueue"
    value = aws_sqs_queue.karpenter_termination_handler[count.index].name
  }

  set {
    name  = "aws.defaultInstanceProfile"
    value = aws_iam_instance_profile.nodes.name
  }

  depends_on = [
    aws_eks_cluster.main,
    kubernetes_config_map.aws-auth,
    aws_eks_node_group.main
  ]

}

resource "kubectl_manifest" "karpenter_node_pool" {
  count = var.karpenter_toggle ? 1 : 0
  yaml_body = templatefile(
    "${path.module}/helm/karpenter/templates/node-pool.yaml.tpl", {
      EKS_CLUSTER        = var.cluster_name,
      CAPACITY_TYPE      = var.karpenter_capacity_type
      INSTANCE_FAMILY    = var.karpenter_instance_family
      INSTANCE_SIZES     = var.karpenter_instance_sizes
      AVAILABILITY_ZONES = var.karpenter_availability_zones
  })

  depends_on = [
    helm_release.karpenter
  ]
}

resource "kubectl_manifest" "karpenter_node_class" {
  count = var.karpenter_toggle ? 1 : 0
  yaml_body = templatefile(
    "${path.module}/helm/karpenter/templates/node-class.yaml.tpl", {
      EKS_CLUSTER = var.cluster_name
      AMI_FAMILY  = var.karpenter_ec2_node_family
      SECURITY_GROUPS = [
        aws_security_group.cluster_sg.id,
        aws_security_group.cluster_nodes_sg.id,
        aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
      ]
      INSTANCE_PROFILE = aws_iam_instance_profile.nodes.name
      AMI_ID           = data.aws_ssm_parameter.eks.value
      EKS_SUBNETS = [
        aws_subnet.private_subnet_1a.id,
        aws_subnet.private_subnet_1b.id,
        aws_subnet.private_subnet_1c.id
      ]
      LAUNCH_TEMPLATE = format("%s-karpenter", var.cluster_name)
  })

  depends_on = [
    helm_release.karpenter
  ]
}

resource "aws_launch_template" "karpenter" {
  count    = var.karpenter_toggle ? 1 : 0
  image_id = data.aws_ssm_parameter.eks.value
  name     = format("%s-karpenter", var.cluster_name)

  update_default_version = true

  vpc_security_group_ids = [
    aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  ]

  user_data = base64encode(templatefile(
    "${path.module}/helm/karpenter/templates/user-data.sh.tpl",
    {
      CLUSTER_NAME       = var.cluster_name,
      CLUSTER_ID         = var.cluster_name,
      APISERVER_ENDPOINT = aws_eks_cluster.main.endpoint,
      B64_CLUSTER_CA     = aws_eks_cluster.main.certificate_authority.0.data
    }
  ))

  iam_instance_profile {
    name = aws_iam_instance_profile.nodes.name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      "Name" : format("%s-karpanter", var.cluster_name)
      "aws-node-termination-handler/managed" = "true"
    }
  }
}


resource "aws_sqs_queue" "karpenter_termination_handler" {
  count                      = var.karpenter_toggle ? 1 : 0
  name                       = format("%s-karpenter", var.cluster_name)
  delay_seconds              = 0
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 60
}

resource "aws_sqs_queue_policy" "karpenter_termination_handler" {
  count     = var.karpenter_toggle ? 1 : 0
  queue_url = aws_sqs_queue.karpenter_termination_handler[count.index].id
  policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "sqs:SendMessage"
      ],
      "Resource": [
        "${aws_sqs_queue.karpenter_termination_handler[count.index].arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "karpenter_termination_handler_instance_terminate" {
  count       = var.karpenter_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-instance-terminate", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance-terminate Lifecycle Action"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_termination_handler_instance_terminate" {
  count     = var.karpenter_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.karpenter_termination_handler_instance_terminate[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_termination_handler_scheduled_change" {
  count       = var.karpenter_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-scheduled-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.health"]
    detail-type = [
      "AWS Health Event"
    ]
    detail = {
      service = [
        "EC2"
      ]
      eventTypeCategory = [
        "scheduledChange"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "karpenter_termination_handler_scheduled_change" {
  count     = var.karpenter_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.karpenter_termination_handler_scheduled_change[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter_termination_handler[count.index].arn
}

resource "aws_cloudwatch_event_rule" "karpenter_termination_handler_spot_termination" {
  count       = var.karpenter_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-spot-termination", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Spot Instance Interruption Warning"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_termination_handler_spot_termination" {
  count     = var.karpenter_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.karpenter_termination_handler_spot_termination[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_termination_handler_rebalance" {
  count       = var.karpenter_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-rebalance", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance Rebalance Recommendation"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_termination_handler_rebalance" {
  count     = var.karpenter_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.karpenter_termination_handler_rebalance[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "karpenter_termination_handler_state_change" {
  count       = var.karpenter_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-state-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance State-change Notification"
    ]
  })
}

resource "aws_cloudwatch_event_target" "karpenter_termination_handler_state_change" {
  count     = var.karpenter_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.karpenter_termination_handler_state_change[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.karpenter_termination_handler[count.index].arn
}
