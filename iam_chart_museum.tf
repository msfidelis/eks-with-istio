data "aws_iam_policy_document" "chartmuseum_assume_role" {

  count = var.enable_chart_museum ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "chartmuseum" {

  count = var.enable_chart_museum ? 1 : 0

  assume_role_policy = data.aws_iam_policy_document.chartmuseum_assume_role[count.index].json
  name               = format("%s-chartmuseum", var.cluster_name)
}

data "aws_iam_policy_document" "chartmuseum" {
  count   = var.enable_chart_museum ? 1 : 0
  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]

    resources = [
      "*"
    ]

  }
}

resource "aws_iam_policy" "chartmuseum" {
  count       = var.enable_chart_museum ? 1 : 0
  name        = format("%s-chartmuseum-policy", var.cluster_name)
  path        = "/"
  description = var.cluster_name

  policy = data.aws_iam_policy_document.chartmuseum[count.index].json
}


resource "aws_iam_policy_attachment" "chartmuseum" {
  count = var.enable_chart_museum ? 1 : 0
  name  = "cluster_autoscaler"
  roles = [
    aws_iam_role.chartmuseum[count.index].name
  ]

  policy_arn = aws_iam_policy.chartmuseum[count.index].arn
}
