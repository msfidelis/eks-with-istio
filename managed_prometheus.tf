resource "aws_cloudwatch_log_group" "prometheus" {
  count             = var.enable_managed_prometheus ? 1 : 0
  name              = format("%s-prometheus", var.cluster_name)
  retention_in_days = 1
}

resource "aws_prometheus_workspace" "main" {
  count = var.enable_managed_prometheus ? 1 : 0
  alias = var.cluster_name

  logging_configuration {
    log_group_arn = "${aws_cloudwatch_log_group.prometheus[count.index].arn}:*"
  }
}