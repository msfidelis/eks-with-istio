resource "helm_release" "node_termination_handler" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  name      = "aws-node-termination-handler"
  namespace = "kube-system"

  chart      = "aws-node-termination-handler"
  repository = "https://aws.github.io/eks-charts/"
  version    = "0.21.0"

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_node_termination_handler_role[count.index].arn
  }

  set {
    name  = "awsRegion"
    value = var.aws_region
  }

  set {
    name  = "queueURL"
    value = aws_sqs_queue.node_termination_handler[count.index].url
  }

  set {
    name  = "enableSqsTerminationDraining"
    value = true
  }

  set {
    name  = "enableSpotInterruptionDraining"
    value = true
  }

  set {
    name  = "enableRebalanceMonitoring"
    value = true
  }

  set {
    name  = "enableRebalanceDraining"
    value = true
  }

  set {
    name  = "enableScheduledEventDraining"
    value = true
  }

  set {
    name  = "deleteSqsMsgIfNodeNotFound"
    value = true
  }

    set {
    name  = "checkTagBeforeDraining"
    value = false
  }

}

resource "aws_sqs_queue" "node_termination_handler" {
  count                      = var.node_termination_handler_toggle ? 1 : 0
  name                       = format("%s-aws-node-termination-handler", var.cluster_name)
  delay_seconds              = 0
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 60
}

resource "aws_sqs_queue_policy" "node_termination_handler" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  queue_url = aws_sqs_queue.node_termination_handler[count.index].id
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
        "${aws_sqs_queue.node_termination_handler[count.index].arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "node_termination_handler_instance_terminate" {
  count       = var.node_termination_handler_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-instance-terminate", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance-terminate Lifecycle Action"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_instance_terminate" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.node_termination_handler_instance_terminate[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_scheduled_change" {
  count       = var.node_termination_handler_toggle ? 1 : 0
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

resource "aws_cloudwatch_event_target" "node_termination_handler_scheduled_change" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.node_termination_handler_scheduled_change[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler[count.index].arn
}

resource "aws_cloudwatch_event_rule" "node_termination_handler_spot_termination" {
  count       = var.node_termination_handler_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-spot-termination", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Spot Instance Interruption Warning"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_spot_termination" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.node_termination_handler_spot_termination[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_rebalance" {
  count       = var.node_termination_handler_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-rebalance", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance Rebalance Recommendation"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_rebalance" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.node_termination_handler_rebalance[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler[count.index].arn
}


resource "aws_cloudwatch_event_rule" "node_termination_handler_state_change" {
  count       = var.node_termination_handler_toggle ? 1 : 0
  name        = format("%s-node-termination-handler-state-change", var.cluster_name)
  description = var.cluster_name

  event_pattern = jsonencode({
    source = ["aws.ec2"]
    detail-type = [
      "EC2 Instance State-change Notification"
    ]
  })
}

resource "aws_cloudwatch_event_target" "node_termination_handler_state_change" {
  count     = var.node_termination_handler_toggle ? 1 : 0
  rule      = aws_cloudwatch_event_rule.node_termination_handler_state_change[count.index].name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.node_termination_handler[count.index].arn
}
