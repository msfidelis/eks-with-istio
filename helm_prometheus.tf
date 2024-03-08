
resource "helm_release" "prometheus" {

  count = var.enable_prometheus_stack ? 1 : 0

  name             = "prometheus"
  chart            = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = "prometheus"
  create_namespace = true

  version = "45.8.0"

  # set {
  #   name  = "fullnameOverride"
  #   value = "prometheus"
  # }

  values = [
    "${file("./helm/prometheus/values.yml")}"
  ]


  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth
  ]
}


resource "kubectl_manifest" "grafana_gateway" {

  count = var.enable_prometheus_stack ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: grafana
  namespace: prometheus
spec:
  selector:
    istio: ingressgateway 
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - ${var.grafana_virtual_service_host}
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.prometheus
  ]

}

resource "kubectl_manifest" "grafana_service" {

  count = var.enable_prometheus_stack ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: grafana
  namespace: prometheus
spec:
  hosts:
  - ${var.grafana_virtual_service_host}
  gateways:
  - grafana
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: prometheus-grafana
        port:
          number: 80
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.prometheus
  ]

}
