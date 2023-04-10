terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "~> 3.0"
    }
    helm = {
      source  = "helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "kubernetes"
      version = "~> 2.0"
    } 
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }  
    tls = {
      source  = "tls"
      version = "~> 3.1.0"
    }
  }
}

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

provider "kubectl" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.default.token
}