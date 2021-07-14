data "aws_iam_policy_document" "cluster_autoscaler_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = [
          "system:serviceaccount:kube-system:cluster-autoscaler",
          "system:serviceaccount:kube-system:aws-cluster-autoscaler"
        ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "cluster_autoscaler_role" {
  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_role.json
  name               = format("%s-cluster-autoscaler", var.cluster_name)
}

data "aws_iam_policy_document" "cluster_autoscaler_policy" {
    version = "2012-10-17"

    statement {

        effect  = "Allow"
        actions = [
            "autoscaling-plans:DescribeScalingPlans",
            "autoscaling-plans:GetScalingPlanResourceForecastData",
            "autoscaling-plans:DescribeScalingPlanResources",   
            "autoscaling:DescribeAutoScalingNotificationTypes",
            "autoscaling:DescribeLifecycleHookTypes",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeTerminationPolicyTypes",
            "autoscaling:DescribeScalingProcessTypes",
            "autoscaling:DescribePolicies",
            "autoscaling:DescribeTags",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeMetricCollectionTypes",
            "autoscaling:DescribeLoadBalancers",
            "autoscaling:DescribeLifecycleHooks",
            "autoscaling:DescribeAdjustmentTypes",
            "autoscaling:DescribeScalingActivities",
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAccountLimits",
            "autoscaling:DescribeScheduledActions",
            "autoscaling:DescribeLoadBalancerTargetGroups",
            "autoscaling:DescribeNotificationConfigurations",
            "autoscaling:DescribeInstanceRefreshes",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "ec2:DescribeLaunchTemplateVersions"        
        ]

        resources = [ 
          "*"
        ]

    }
}

resource "aws_iam_policy" "cluster_autoscaler_policy" {
    name        = format("%s-cluster-autoscaler", var.cluster_name)
    path        = "/"
    description = var.cluster_name

    policy = data.aws_iam_policy_document.cluster_autoscaler_policy.json
}

resource "aws_iam_policy_attachment" "cluster_autoscaler" {
    name       = "cluster_autoscaler"
    roles      = [ 
      aws_iam_role.cluster_autoscaler_role.name
    ]

    policy_arn = aws_iam_policy.cluster_autoscaler_policy.arn
}