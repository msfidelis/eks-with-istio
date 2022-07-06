resource "aws_eks_addon" "cni" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "vpc-cni"

  addon_version     = "v1.11.2-eksbuild.1"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    kubernetes_config_map.aws-auth
  ]

}

resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "coredns"

  addon_version     = "v1.8.3-eksbuild.1"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth
  ]
}

resource "aws_eks_addon" "kubeproxy" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "kube-proxy"

  addon_version     = "v1.20.7-eksbuild.1"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    kubernetes_config_map.aws-auth
  ]
}

resource "aws_eks_addon" "csi_driver" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "aws-ebs-csi-driver"

  addon_version     = "v1.8.0-eksbuild.0"
  resolve_conflicts = "OVERWRITE"

  depends_on = [
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth
  ]

}