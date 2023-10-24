data "aws_iam_policy_document" "karpenter_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values = [
        "system:serviceaccount:karpenter:karpenter"
      ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "karpenter_role" {
  count              = var.karpenter_toggle ? 1 : 0
  assume_role_policy = data.aws_iam_policy_document.karpenter_role.json
  name               = format("%s-karpenter", var.cluster_name)
}


data "aws_iam_policy_document" "karpenter_policy" {
  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "ec2:CreateLaunchTemplate",
      "ec2:CreateFleet",
      "ec2:CreateTags",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeInstances",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeSpotPriceHistory",
      "pricing:GetProducts",
      "ec2:RunInstances",
      "ssm:GetParameter",
      "iam:PassRole"
    ]

    resources = [
      "*"
    ]

  }

  statement {

    effect = "Allow"
    actions = [
      "ec2:TerminateInstances",
      "ec2:DeleteLaunchTemplate",
    ]

    resources = [
      "*"
    ]

  }

}

resource "aws_iam_policy" "karpenter_policy" {
  count        = var.karpenter_toggle ? 1 : 0
  name        = format("%s-karpenter", var.cluster_name)
  path        = "/"
  description = var.cluster_name

  policy = data.aws_iam_policy_document.karpenter_policy.json
}

resource "aws_iam_policy_attachment" "karpenter_policy" {
  count = var.karpenter_toggle ? 1 : 0
  name = "karpenter"
  roles = [
    aws_iam_role.karpenter_role[count.index].name
  ]

  policy_arn = aws_iam_policy.karpenter_policy[count.index].arn
}
