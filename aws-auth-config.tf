resource "kubernetes_config_map" "aws-auth" {
  metadata {
      name = "aws-auth"
      namespace = "kube-system"
  }

  data = {
      mapRoles = <<YAML
- rolearn: ${aws_iam_role.eks_nodes_roles.name}
  username: system:node:{{EC2PrivateDNSName}}  
  groups:
    - system:bootstrappers
    - system:nodes
- rolearn: ${aws_iam_role.eks_nodes_roles.name}
  username: system:node:{{EC2PrivateDNSName}}  
  groups:
    - system:bootstrappers
    - system:nodes
    - system:nodes-proxier
- rolearn: ${aws_iam_role.eks_nodes_roles.name}
  username: system:node:{{EC2PrivateDNSName}}  
  groups:
    - system:bootstrappers
    - system:nodes
    - system:nodes-proxier
YAML
  }
}