data "aws_iam_policy_document" "managed_prometheus_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values = [
        "system:serviceaccount:prometheus:managed-prometheus"
      ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "managed_prometheus_role" {
  assume_role_policy = data.aws_iam_policy_document.managed_prometheus_role.json
  name               = format("%s-managed-prometheus", var.cluster_name)
}


data "aws_iam_policy_document" "managed_prometheus_policy" {
  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "aps:QueryMetrics",
      "aps:GetSeries",
      "aps:GetLabels",
      "aps:GetMetricMetadata",
      "aps:RemoteWrite"
    ]

    resources = [
      "*"
    ]

  }
}

resource "aws_iam_policy" "managed_prometheus_policy" {
  name        = format("%s-managed-prometheus", var.cluster_name)
  path        = "/"
  description = var.cluster_name

  policy = data.aws_iam_policy_document.managed_prometheus_policy.json
}

resource "aws_iam_policy_attachment" "managed_prometheus_policy" {
  name = format("%s-managed-prometheus", var.cluster_name)
  roles = [
    aws_iam_role.managed_prometheus_role.name
  ]

  policy_arn = aws_iam_policy.managed_prometheus_policy.arn
}
