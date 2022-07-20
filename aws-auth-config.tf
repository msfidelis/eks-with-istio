resource "kubernetes_config_map" "aws-auth" {
  metadata {
      name = "aws-auth"
      namespace = "kube-system"
  }

  data = {
      mapRoles = <<YAML
- rolearn: ${aws_iam_role.eks_nodes_roles.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
  - system:bootstrappers
  - system:nodes
  - system:node-proxier
YAML
  }

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}
