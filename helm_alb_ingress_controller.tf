resource "helm_release" "alb_ingress_controller" {
    name                = "aws-load-balancer-controller"
    repository          = "https://aws.github.io/eks-charts" 
    chart               = "aws-load-balancer-controller"
    namespace           = "kube-system"
    create_namespace    = true

    set {
        name            = "clusterName"
        value           = var.cluster_name
    }

    set {
        name            = "serviceAccount.create"
        value           = false
    }

    set {
        name            = "serviceAccount.name"
        value           = aws_iam_role.alb_controller.name
    }

    depends_on = [
        aws_eks_cluster.eks_cluster
    ]
}