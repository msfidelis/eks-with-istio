variable "cluster_name" {
  default = "eks-cluster"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "k8s_version" {
  default = "1.22"
}

variable "nodes_instances_sizes" {
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 4
    max     = 10
    desired = 6
  }
}

variable "nlb_ingress_internal" {
  type    = bool
  default = false
}

variable "nlb_ingress_type" {
  type    = string
  default = "network"
}

variable "proxy_protocol_v2" {
  type    = bool 
  default = false
}

variable "nlb_ingress_enable_termination_protection" {
  type    = bool
  default = false
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = true
}

variable "cluster_private_zone" {
  type    = string
  default = "k8s.cluster"
}

variable "kiali_virtual_service_host" {
  type    = string 
  default = "kiali.k8s.raj.ninja"
}

variable "grafana_kiali_virtual_service_host" {
  type    = string 
  default = "grafana.kiali.k8s.raj.ninja"
}

variable "default_tags" {
  default = {
    Environment = "prod"
    Foo         = "Bar"
    Ping        = "Pong"
  }
}