# resource "helm_release" "prometheus_operator" {
#     name                = "prometheus-operator"
#     repository          = "https://prometheus-community.github.io/helm-charts" 
#     chart               = "prometheus-operator"
#     namespace           = "prometheus"
#     create_namespace    = true

#     depends_on = [
#         aws_eks_cluster.eks_cluster,
#         aws_eks_node_group.cluster,
#         kubernetes_config_map.aws-auth
#     ]  
# }
