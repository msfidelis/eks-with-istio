data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.eks_cluster.id
}

data "aws_caller_identity" "current" {}