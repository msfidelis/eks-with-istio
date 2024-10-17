resource "helm_release" "argo_rollouts" {
  count = var.argo_rollouts_toggle ? 1 : 0

  name       = "argo-rollouts"
  chart      = "argo-rollouts"
  repository = "https://argoproj.github.io/argo-helm"
  namespace  = "argo-rollouts"

  version = "2.34.1"

  create_namespace = true

  set {
    name  = "dashboard.enabled"
    value = true
  }

  set {
    name  = "controller.metrics.enabled"
    value = true
  }

  set {
    name  = "podAnnotations.prometheus\\.io/scrape"
    value = true
  }

  set {
    name  = "podAnnotations.prometheus\\.io/path"
    value = "/metrics"
  }

  set {
    name  = "podAnnotations.prometheus\\.io/port"
    value = "8090"
  }


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth
  ]
}

resource "kubectl_manifest" "rollouts_gateway" {
  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: argo-gateway
  namespace: argo-rollouts
spec:
  selector:
    istio: ingressgateway 
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - ${var.argo_rollouts_virtual_service_host}
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod
  ]

}


resource "kubectl_manifest" "rollouts_virtual_service" {
  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: argo-rollouts
  namespace: argo-rollouts
spec:
  hosts:
  - ${var.argo_rollouts_virtual_service_host}
  gateways:
  - argo-gateway
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: argo-rollouts-dashboard
        port:
          number: 3100
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod,
    helm_release.argo_rollouts
  ]

}