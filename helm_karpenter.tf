resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile-${var.cluster_name}"
  role = aws_iam_role.eks_nodes_roles.name
}

resource "helm_release" "karpenter" {
    namespace        = "karpenter"
    create_namespace = true

    count = var.scaling_provider == "karpenter" ? 1 : 0

    name       = "karpenter"
    repository = "https://charts.karpenter.sh"
    chart      = "karpenter"
    version    = "v0.13.1"

    set {
        name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
        value = aws_iam_role.karpenter_role.arn
    }

    set {
        name  = "clusterName"
        value = var.cluster_name
    }

    set {
        name  = "clusterEndpoint"
        value = aws_eks_cluster.eks_cluster.endpoint
    }

    set {
        name  = "aws.defaultInstanceProfile"
        value = aws_iam_instance_profile.karpenter.name
    }

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_eks_node_group.cluster,
        kubernetes_config_map.aws-auth
    ]

}

# resource "kubernetes_manifest" "karpenter" {

#     count = var.scaling_provider == "karpenter" ? 1 : 0

#     computed_fields = ["spec.requirements"]

#     manifest = {
#         apiVersion = "karpenter.sh/v1alpha5"
#         kind       = "Provisioner"

#         metadata = {
#             name = var.cluster_name
#         }

#         spec = {
#             requirements = [
#                 {
#                     key         = "karpenter.k8s.aws/instance-family"
#                     operator    = "In"
#                     values      = [
#                         "c5", "r5"
#                     ]
#                 },
#                 {
#                     key         = "karpenter.sh/capacity-type"
#                     operator    = "In"
#                     values      = [
#                         "spot"
#                     ]
#                 },
#                 {
#                     key         = "karpenter.k8s.aws/instance-size"
#                     operator    = "In"
#                     values      = [
#                         "large",
#                         "xlarge",
#                         "2xlarge"
#                     ]
#                 }           
#             ]
#             limits = {
#                 resources = {
#                     cpu     = 100
#                     memory  = "4000Gi"
#                 }
#             }
#             providerRef = {
#                 name    = var.cluster_name
#             }

#         }
#     }


#     depends_on = [
#       helm_release.karpenter
#     ]
# }
