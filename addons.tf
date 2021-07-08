resource "aws_eks_addon" "cni" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "vpc-cni"

  addon_version     = "v1.8.0-eksbuild.1"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "coredns"

  addon_version     = "v1.8.3-eksbuild.1"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kubeproxy" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  addon_name        = "kube-proxy"

  addon_version     = "v1.20.4-eksbuild.2"
  resolve_conflicts = "OVERWRITE"
}