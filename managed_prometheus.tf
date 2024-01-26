// enable_managed_prometheus

resource "aws_prometheus_workspace" "main" {

  count = var.enable_managed_prometheus ? 1 : 0

  alias       = var.cluster_name
  kms_key_arn = aws_kms_key.example.arn
}