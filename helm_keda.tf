resource "helm_release" "keda" {
    count               = var.keda_toggle ? 1 : 0

    version             = "2.12.0"

    name                = "keda"
    chart               = "keda"
    repository          = "https://kedacore.github.io/charts" 
    namespace           = "keda"
    create_namespace    = true

    set {
        name            = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
        value           = aws_iam_role.keda_role.arn
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]
}