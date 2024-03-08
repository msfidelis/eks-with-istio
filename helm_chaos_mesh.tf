resource "helm_release" "chaos_mesh" {
  count = var.chaos_mesh_toggle ? 1 : 0

  name             = "chaos-mesh"
  chart            = "chaos-mesh"
  repository       = "https://charts.chaos-mesh.org"
  namespace        = "chaos-testing"
  create_namespace = true

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth
  ]
}