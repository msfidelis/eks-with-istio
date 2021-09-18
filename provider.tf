provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

provider "helm" {
  kubernetes {
    host                   =  aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate =  base64decode(aws_eks_cluster.eks_cluster.certificate_authority.0.data)
    token                  =  data.aws_eks_cluster_auth.default.token 
  }
}

provider "kubernetes" {
  host                   =  aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate =  base64decode(aws_eks_cluster.eks_cluster.certificate_authority.0.data)
  token                  =  data.aws_eks_cluster_auth.default.token 
}