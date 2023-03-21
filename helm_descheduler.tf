resource "helm_release" "descheduler" {
    count               = var.descheduler_toggle ? 1 : 0

    name                = "descheduler"
    repository          = "https://kubernetes-sigs.github.io/descheduler" 
    chart               = "descheduler"
    namespace           = "kube-system"
    create_namespace    = true


    set {
        name    = "cronJobApiVersion"
        value   = "batch/v1beta1"
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]
}