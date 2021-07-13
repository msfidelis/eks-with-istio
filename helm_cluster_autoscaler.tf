resource "helm_release" "cluster_autoscaler" {

    name                = "cluster-autoscaler"
    chart               = "./helm/cluster-autoscaler"
    namespace           = "kube-system"
    create_namespace    = true

    set {
        name    = "release"
        value   = timestamp()
    }

    set {
        name    = "replicas"
        value   = 1
    }    

    set {
        name    = "CLUSTER_NAME"
        value   = var.cluster_name
    }

    set {
        name    = "AmazonEKSClusterAutoscalerRole"
        value   = aws_iam_role.cluster_autoscaler_role.arn
    }

    set {
        name    = "ACCOUNT_ID"
        value   = data.aws_caller_identity.current.account_id
    }


    depends_on = [
        aws_eks_cluster.eks_cluster,
        helm_release.istio_base
    ]
}