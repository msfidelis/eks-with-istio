resource "kubectl_manifest" "argo_projects" {

  count = var.enable_argocd ? 1 : 0

  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: ${var.cluster_name}
  namespace: default
spec:
  clusterResourceWhitelist:
  - group: '*'
    kind: '*'
  destinations:
  - namespace: '*'
    server: '*'
  sourceRepos:
  - '*'
YAML

  depends_on = [
    helm_release.argocd
  ]

}