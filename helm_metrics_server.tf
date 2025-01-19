resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "metrics-server"
  namespace  = "kube-system"

  set {
    name  = "apiService.create"
    value = "true"
  }

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth
  ]
}
