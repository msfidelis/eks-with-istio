
resource "aws_s3_bucket" "fluentd" {
  bucket = format("%s-logging-%s", var.cluster_name, data.aws_caller_identity.current.account_id)
  acl    = "private"
}

data "aws_iam_policy_document" "fluentd_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = [
          "system:serviceaccount:fluentbit:fluent-bit",
          "system:serviceaccount:fluentd:fluent-bit"
        ]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "fluentd_role" {
  assume_role_policy = data.aws_iam_policy_document.fluentd_role.json
  name               = format("%s-fluentd-logger", var.cluster_name)
}

data "aws_iam_policy_document" "fluentd_policy" {
    version = "2012-10-17"

    statement {

        effect  = "Allow"
        actions = [
            "s3:*"
        ]

        resources = [ 
          format("%s", aws_s3_bucket.fluentd.arn),
          format("%s/*", aws_s3_bucket.fluentd.arn),
        ]

    }
}

resource "aws_iam_policy" "fluentd_policy" {
    name        = format("%s-fluentd-logger", var.cluster_name)
    path        = "/"
    description = var.cluster_name

    policy = data.aws_iam_policy_document.fluentd_policy.json
}

resource "aws_iam_policy_attachment" "fluentd" {
    name       = "fluentd"
    roles      = [ 
      aws_iam_role.fluentd_role.name
    ]

    policy_arn = aws_iam_policy.fluentd_policy.arn
}


resource "helm_release" "fluentbit_poc" {
    name                = "fluentbit-eks"
    chart               = "./helm/fluentbit-eks"
    namespace           = "fluentd"
    create_namespace    = true

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]

    set {
        name  = "serviceaccount.eks_role"
        value = aws_iam_role.fluentd_role.arn
    }

    set {
        name  = "s3.region"
        value = aws_s3_bucket.fluentd.region
    }    

    set {
        name  = "s3.bucket_name"
        value = aws_s3_bucket.fluentd.id
    }  

}