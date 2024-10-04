resource "helm_release" "jaeger" {

  count = var.enable_jaeger ? 1 : 0

  name       = "jaeger"
  repository = "https://jaegertracing.github.io/helm-charts"
  chart      = "jaeger"
  namespace  = "jaeger"

  version = "0.69.1"

  create_namespace = true

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth
  ]
}

resource "kubectl_manifest" "jaeger_gateway" {

  count = var.enable_jaeger ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: jaeger-query
  namespace: jaeger
spec:
  selector:
    istio: ingressgateway 
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - ${var.jaeger_virtual_service_host}
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod,
    helm_release.jaeger
  ]

}

resource "kubectl_manifest" "jaeger_virtual_service" {

  count = var.enable_jaeger ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: jaeger-query
  namespace: jaeger
spec:
  hosts:
  - ${var.jaeger_virtual_service_host}
  gateways:
  - jaeger-query
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: jaeger-query
        port:
          number: 80
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod,
    helm_release.jaeger
  ]

}