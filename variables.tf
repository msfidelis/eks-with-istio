variable "cluster_name" {
  default = "eks-cluster"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "k8s_version" {
  default = "1.28"
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
  default = false
}

variable "cluster_private_zone" {
  type    = string
  default = "k8s.cluster"
}

variable "chaos_mesh_toggle" {
  type        = bool
  description = "Enable Chaos Mesh Installation"
  default     = false
}

variable "node_termination_handler_toggle" {
  type        = bool
  description = "Enable AWS Node Termination Handler Setup"
  default     = false
}

variable "argo_rollouts_toggle" {
  type        = bool
  description = "Enable Argo Rollouts Installation"
  default     = true
}

variable "keda_toggle" {
  type        = bool
  description = "Enable Keda Installation"
  default     = true
}

variable "grafana_virtual_service_host" {
  type    = string
  default = "grafana.k8s.raj.ninja"
}

variable "kiali_virtual_service_host" {
  type    = string
  default = "kiali.k8s.raj.ninja"
}

variable "jaeger_virtual_service_host" {
  type    = string
  default = "jaeger.k8s.raj.ninja"
}

variable "istio_ingress_min_pods" {
  type        = number
  default     = 3
  description = "Minimum pods for istio-ingress-gateway"
}

variable "istio_ingress_max_pods" {
  type        = number
  default     = 9
  description = "Maximum pods for istio-ingress-gateway"
}

variable "cluster_autoscaler_toggle" {
  type        = bool
  description = "Enable Cluster Autoscaler Installation"
  default     = true
}

variable "descheduler_toggle" {
  type        = bool
  description = "Enable Descheduler Installation"
  default     = false
}

variable "addon_cni_version" {
  type        = string
  description = "VPC CNI Version"
  default     = "v1.12.6-eksbuild.1"
}

variable "addon_coredns_version" {
  type        = string
  description = "CoreDNS Version"
  default     = "v1.10.1-eksbuild.2"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "Kubeproxy Version"
  default     = "v1.27.3-eksbuild.2"
}

variable "addon_csi_version" {
  type        = string
  description = "CSI Version"
  default     = "v1.17.0-eksbuild.1"
}

variable "default_tags" {
  default = {
    Environment = "prod"
    Foo         = "Bar"
    Ping        = "Pong"
  }
}
