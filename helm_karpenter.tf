resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile-${var.cluster_name}"
  role = aws_iam_role.eks_nodes_roles.name
}

resource "helm_release" "karpenter" {
    namespace        = "karpenter"
    create_namespace = true

    count = var.scaling_provider == "karpenter" ? 1 : 0

    name       = "karpenter"
    repository = "https://charts.karpenter.sh"
    chart      = "karpenter"
    version    = "v0.13.1"

    set {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
        value = aws_iam_role.karpenter_role.arn
    }

    set {
        name  = "clusterName"
        value = var.cluster_name
    }

    set {
        name  = "clusterEndpoint"
        value = aws_eks_cluster.eks_cluster.endpoint
    }

    set {
        name  = "aws.defaultInstanceProfile"
        value = aws_iam_instance_profile.karpenter.name
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]

}