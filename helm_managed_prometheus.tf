# resource "helm_release" "managed_prometheus" {

#   count = var.enable_managed_prometheus ? 1 : 0

#   name             = "prometheus"
#   chart            = "prometheus"
#   repository       = "https://prometheus-community.github.io/helm-charts"
#   namespace        = "prometheus"
#   create_namespace = true

#   set {
#     name  = "serviceAccounts.server.name"
#     value = "managed-prometheus"
#   }

#   set {
#     name  = "serviceAccounts.server.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = aws_iam_role.managed_prometheus_role.arn
#   }

#   set {
#     name  = "server.remoteWrite[0].url"
#     value = format("%sapi/v1/remote_write", aws_prometheus_workspace.main[0].prometheus_endpoint)
#   }

#   set {
#     name  = "server.remoteWrite[0].sigv4.region"
#     value = var.aws_region
#   }

#   set {
#     name  = "server.remoteWrite[0].queue_config.max_samples_per_send"
#     value = "1000"
#   }

#   set {
#     name  = "server.remoteWrite[0].queue_config.max_shards"
#     value = "200"
#   }

#   set {
#     name  = "server.remoteWrite[0].queue_config.capacity"
#     value = "2500"
#   }

#   set {
#     name  = "server.persistentVolume.enabled"
#     value = "false"
#   }


#   set {
#     name  = "prometheus-pushgateway.enabled"
#     value = "false"
#   }


#   set {
#     name  = "prometheus-pushgateway.enabled"
#     value = "false"
#   }

#   set {
#     name  = "alertmanager.enabled"
#     value = "false"
#   }

#   depends_on = [
#     aws_eks_cluster.eks_cluster,
#     aws_eks_node_group.cluster,
#     kubernetes_config_map.aws-auth
#   ]
# }




resource "helm_release" "managed_prometheus" {

  count = var.enable_managed_prometheus ? 1 : 0

  name             = "prometheus"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "prometheus"
  create_namespace = true

  version = "45.8.0"

  # set {
  #   name  = "fullnameOverride"
  #   value = "prometheus"
  # }

  values = [
    "${file("./helm/prometheus/values.yml")}"
  ]


  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth
  ]
}
