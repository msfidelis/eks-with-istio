data "aws_iam_policy_document" "argocd_assume_role" {

  count = var.enable_argocd ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "argocd" {

  count = var.enable_argocd ? 1 : 0

  assume_role_policy = data.aws_iam_policy_document.argocd_assume_role[count.index].json
  name               = format("%s-argocd", var.cluster_name)
}

data "aws_iam_policy_document" "argocd_policy" {

  count = var.enable_argocd ? 1 : 0

  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      "*"
    ]
  }

}

resource "aws_iam_policy" "argocd_policy" {

  count = var.enable_argocd ? 1 : 0

  name        = format("%s-argocd-policy", var.cluster_name)
  path        = "/"
  description = var.cluster_name
  policy      = data.aws_iam_policy_document.argocd_policy[count.index].json
}

resource "aws_iam_policy_attachment" "argocd_policy" {

  count = var.enable_argocd ? 1 : 0

  name = format("%s-argocd-policy", var.cluster_name)
  roles = [
    aws_iam_role.argocd[count.index].name
  ]
  policy_arn = aws_iam_policy.argocd_policy[count.index].arn
}