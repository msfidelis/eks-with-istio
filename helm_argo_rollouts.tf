resource "helm_release" "argo_rollouts" {
    count               = var.argo_rollouts_toggle ? 1 : 0

    name                = "argo-rollouts"
    chart               = "argo-rollouts"
    repository          = "https://argoproj.github.io/argo-helm" 
    namespace           = "argo-rollouts"
    create_namespace    = true

    set {
        name = "dashboard.enabled"
        value = true
    }


    set {
        name = "controller.metrics.enabled"
        value = true
    }

    # set {
    #     name = "podAnnotations.prometheus\\.io/scrape"
    #     value = true
    # }

    # set {
    #     name = "podAnnotations.prometheus\\.io/path"
    #     value = "/metrics"
    # }

    #     set {
    #     name = "podAnnotations.prometheus\\.io/port"
    #     value = "8090"
    # }


    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]
}