
resource "helm_release" "istio_base" {
    name                = "base"
    chart               = "./helm/istio/base"
    namespace           = "istio-system"
    create_namespace    = true

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth,
        helm_release.alb_ingress_controller
    ]
}

resource "helm_release" "istio_discovery" {
    name                = "istio-discovery"
    chart               = "./helm/istio/istio-discovery"
    namespace           = "istio-system"
    create_namespace    = true

    set {
        name    = "global.hub"
        value   = "gcr.io/istio-release"
    }

    set {
        name    = "global.tag"
        value   = "1.11.0"
    }      

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        helm_release.istio_base,
        kubernetes_config_map.aws-auth,
    ]
}

resource "helm_release" "istio_operator" {
    name                = "istio-operator"
    chart               = "./helm/istio/istio-operator"
    namespace           = "istio-system"
    create_namespace    = true

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        helm_release.istio_base,
        kubernetes_config_map.aws-auth,
    ]
}

resource "helm_release" "istio_ingress" {
    name                = "istio-ingress"
    chart               = "./helm/istio/istio-ingress"
    namespace           = "istio-system"
    create_namespace    = true

    set {
        name    = "global.hub"
        value   = "gcr.io/istio-release"
    }

    set {
        name    = "global.tag"
        value   = "1.11.0"
    }    

    set {
        name    = "gateways.istio-ingressgateway.autoscaleMin"
        value   = 3
    }

    set {
        name    = "gateways.istio-ingressgateway.autoscaleMax"
        value   = 10
    }

    set {
        name    = "gateways.istio-ingressgateway.type"
        value   = "NodePort"
    }

    set {
        name    = "gateways.istio-ingressgateway.type"
        value   = "NodePort"
    }

    set {
        name    = "meshConfig.enablePrometheusMerge"
        value   = true
    }

    set {
        name    = "gateways.istio-ingressgateway.targetgroupbinding.enabled"
        value   = true
    }    

    set {
        name    = "gateways.istio-ingressgateway.targetgroupbinding.http"
        value   = aws_lb_target_group.http.arn
    }    

    set {
        name    = "gateways.istio-ingressgateway.targetgroupbinding.https"
        value   = aws_lb_target_group.https.arn
    }       

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        helm_release.istio_base,
        kubernetes_config_map.aws-auth,
    ]

    # set {
    #     name    = "release"
    #     value   = timestamp()
    # }
}

resource "helm_release" "istio_egress" {
    name                = "istio-egress"
    chart               = "./helm/istio/istio-egress"
    namespace           = "istio-system"
    create_namespace    = true

    set {
        name    = "global.hub"
        value   = "gcr.io/istio-release"
    }

    set {
        name    = "global.tag"
        value   = "1.11.0"
    }    

    set {
        name    = "gateways.istio-egressgateway.autoscaleMin"
        value   = 3
    }

    set {
        name    = "gateways.istio-egressgateway.autoscaleMax"
        value   = 6
    }

    # set {
    #     name    = "release"
    #     value   = timestamp()
    # }    

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        helm_release.istio_base,
        kubernetes_config_map.aws-auth,
    ]
}


resource "helm_release" "istio_kiali" {
    name                = "kiali"
    chart               = "./helm/istio/istio-kiali"
    namespace           = "istio-system"
    create_namespace    = true

    set {
        name    = "release"
        value   = 3
    }

    set {
        name    = "VirtualService.host"
        value   = var.kiali_virtual_service_host
    }

    set {
        name    = "Grafana.host"
        value   = var.grafana_kiali_virtual_service_host
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        helm_release.istio_base,
        kubernetes_config_map.aws-auth,
    ]
}