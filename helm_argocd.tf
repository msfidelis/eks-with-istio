resource "helm_release" "argocd" {

  count = var.enable_argocd ? 1 : 0

  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set {
    name  = "server.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.argocd[count.index].arn
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.argocd[count.index].arn
  }

  set {
    name  = "server.service.type"
    value = "NodePort"
  }

  set {
    name  = "server.service.nodePortHttp"
    value = "31080"
  }

  set {
    name  = "server.service.nodePortHttps"
    value = "31443"
  }


  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  set {
    name  = "server.extensions.enabled"
    value = "true"
  }

  set {
    name  = "server.enable.proxy.extension"
    value = "true"
  }

  set {
    name  = "server.extensions.image.repository"
    value = "quay.io/argoprojlabs/argocd-extension-installer"
  }

  set {
    name  = "server.extensions.extensionList[0].name"
    value = "rollout-extension"
  }

  set {
    name  = "server.extensions.extensionList[0].env[0].name"
    value = "EXTENSION_URL"
  }

  set {
    name  = "server.extensions.extensionList[0].env[0].value"
    value = "https://github.com/argoproj-labs/rollout-extension/releases/download/v0.3.6/extension.tar"
  }      

}

resource "kubectl_manifest" "argo_gateway" {

  count = var.enable_argocd ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: argocd-gateway
  namespace: argocd
spec:
  selector:
    istio: ingressgateway 
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - ${var.argocd_virtual_service_host}
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.argocd,
    helm_release.istio_base,
    helm_release.istiod
  ]

}


resource "kubectl_manifest" "argocd_virtual_service" {
  count = var.enable_argocd ? 1 : 0

  yaml_body = <<YAML
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: argo-server
  namespace: argocd
spec:
  hosts:
  - ${var.argocd_virtual_service_host}
  gateways:
  - argocd-gateway
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: argocd-server
        port:
          number: 80
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main,
    kubernetes_config_map.aws-auth,
    helm_release.argocd,
    helm_release.istio_base,
    helm_release.istiod
  ]

}