resource "helm_release" "chart_museum" {

  count = var.enable_chart_museum ? 1 : 0

  name             = "chartmuseum"
  namespace        = "chartmuseum"
  create_namespace = true

  repository = "https://chartmuseum.github.io/charts"
  chart      = "chartmuseum"

  set {
    name  = "serviceAccount.create"
    value = true
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.chartmuseum[count.index].arn
  }

  set {
    name  = "env.open.DISABLE_API"
    value = "false"
  }

  set {
    name  = "env.open.STORAGE"
    value = "amazon"
  }

  set {
    name  = "env.open.AWS_SDK_LOAD_CONFIG"
    value = "true"
  }


  set {
    name  = "env.open.STORAGE_AMAZON_BUCKET"
    value = aws_s3_bucket.museum[count.index].id
  }

  set {
    name  = "env.open.STORAGE_AMAZON_REGION"
    value = var.aws_region
  }

  set {
    name  = "env.open.DEBUG"
    value = "true"
  }

  set {
    name  = "env.open.DISABLE_STATEFILES"
    value = "true"
  }

}