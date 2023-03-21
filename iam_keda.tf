data "aws_iam_policy_document" "keda_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = [
          "system:serviceaccount:keda:keda-operator"
        ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}


resource "aws_iam_role" "keda_role" {
  assume_role_policy = data.aws_iam_policy_document.keda_role.json
  name               = format("%s-keda", var.cluster_name)
}

data "aws_iam_policy_document" "keda_policy" {
    version = "2012-10-17"

    statement {

        effect  = "Allow"
        actions = [
            "sqs:Get*",
            "sqs:Describe*",
        ]

        resources = [ 
          "*"
        ]

    }
}

resource "aws_iam_policy" "keda_policy" {
    name        = format("%s-keda", var.cluster_name)
    path        = "/"
    description = var.cluster_name

    policy = data.aws_iam_policy_document.keda_policy.json
}

resource "aws_iam_policy_attachment" "keda" {
    name       = "keda"
    roles      = [ 
      aws_iam_role.keda_role.name
    ]

    policy_arn = aws_iam_policy.keda_policy.arn
}
