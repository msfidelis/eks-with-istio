resource "aws_grafana_workspace" "grafana" {

  count = var.enable_managed_prometheus ? 1 : 0

  account_access_type      = var.managed_prometheus_access_type
  authentication_providers = var.managed_grafana_authentication_providers
  permission_type          = var.managed_grafana_permission_type
  role_arn                 = aws_iam_role.grafana[count.index].arn


  data_sources              = var.managed_grafana_datasources
  notification_destinations = var.managed_grafana_notification_destinations

  vpc_configuration {
    subnet_ids = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id,
      aws_subnet.private_subnet_1c.id
    ]
    security_group_ids = [
      aws_security_group.cluster_nodes_sg.id
    ]
  }
}

resource "aws_iam_role" "grafana" {

  count = var.enable_managed_prometheus ? 1 : 0

  name = format("%s-managed-grafana", var.cluster_name)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      },
    ]
  })
}

# resource "aws_grafana_role_association" "grafana" {
#   user_ids     = ["USER_ID_1", "USER_ID_2"]
#   workspace_id = aws_grafana_workspace.grafana.id
# }
