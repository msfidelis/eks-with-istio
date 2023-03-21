resource "helm_release" "argo_rollouts" {
    name                = "argo-rollouts"
    chart               = "argo-rollouts"
    repository          = "https://argoproj.github.io/argo-helm" 
    namespace           = "argo-rollouts"
    create_namespace    = true

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]
}