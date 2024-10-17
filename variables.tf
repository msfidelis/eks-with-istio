#########################
###  GENERAL CONFIGS  ###
#########################

variable "cluster_name" {
  description = "The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region."
  default     = "eks-cluster"
}

variable "aws_region" {
  description = "AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside."
  default     = "us-east-1"
}

variable "k8s_version" {
  description = "The version of Kubernetes to use for the EKS cluster. This version should be compatible with the AWS EKS service and other infrastructure components."
  default     = "1.31"
}

#########################
### CAPACITY CONFIGS  ###
#########################

variable "nodes_instances_sizes" {
  description = "A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload."
  default = [
    "t3.large"
  ]
}

variable "auto_scale_options" {
  description = "Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes."
  default = {
    min     = 4
    max     = 10
    desired = 4
  }
}

variable "cluster_autoscaler_toggle" {
  type        = bool
  description = "Enable or disable the Cluster Autoscaler installation. When true, Cluster Autoscaler is installed to automatically adjust the number of nodes in the cluster."
  default     = false
}


#########################
### KARPENTER CONFIGS ###
#########################

variable "karpenter_toggle" {
  type        = bool
  description = "Determines whether Karpenter is enabled for the EKS cluster. Karpenter is an open-source auto-scaler for Kubernetes clusters."
  default     = true
}

variable "karpenter_instance_family" {
  type        = list(any)
  description = "Defines a list of EC2 instance families to be considered by Karpenter for node provisioning. Instance families like 'c6' and 'c5' offer different compute capabilities."
  default = [
    "c6",
    "c6a",
    "c5"
  ]
}

variable "karpenter_instance_sizes" {
  type        = list(any)
  description = "Specifies a list of instance sizes within the chosen instance families to allow diversity in the provisioned nodes by Karpenter."
  default = [
    "large",
    "2xlarge"
  ]
}

variable "karpenter_capacity_type" {
  type        = list(any)
  description = "Defines the capacity types for provisioning instances in the cluster, such as 'spot' or 'on_demand', offering cost-saving options or consistent availability respectively."
  default = [
    "spot"
  ]
}

variable "karpenter_availability_zones" {
  type        = list(any)
  description = "A list of AWS availability zones where Karpenter should launch nodes. These zones should be in the same region as the EKS cluster."
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "karpenter_ec2_node_family" {
  default = "Bottlerocket"
}

#########################
###  INGRESS CONFIGS  ###
#########################

variable "nlb_ingress_internal" {
  type        = bool
  description = "Indicates whether the Network Load Balancer (NLB) for the EKS cluster should be internal, restricting access to within the AWS network."
  default     = false
}

variable "nlb_ingress_type" {
  type        = string
  description = "Specifies the type of ingress to be used, such as 'network', determining how the NLB handles incoming traffic to the EKS cluster."
  default     = "network"
}

variable "proxy_protocol_v2" {
  type        = bool
  description = "Enables or disables Proxy Protocol v2 on the Network Load Balancer, used for preserving client IP addresses and other connection information."
  default     = false
}

variable "nlb_ingress_enable_termination_protection" {
  type        = bool
  description = "Determines if termination protection is enabled for the Network Load Balancer, preventing accidental deletion."
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  type        = bool
  description = "Controls whether cross-zone load balancing is enabled for the Network Load Balancer, allowing even traffic distribution across all zones."
  default     = false
}

variable "enable_vpc_link" {
  type        = bool
  description = "Create VPC Link associated to Network Load Balancing"
  default     = false
}

#########################
###  ROUTE53 CONFIGS  ###
#########################

variable "cluster_private_zone" {
  type        = string
  description = "The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster."
  default     = "k8s.cluster"
}

#########################
###  ISTIO CONFIGS    ###
#########################

variable "istio_ingress_min_pods" {
  type        = number
  description = "The minimum number of pods to maintain for the Istio ingress gateway. This ensures basic availability and load handling."
  default     = 3
}

variable "istio_ingress_max_pods" {
  type        = number
  description = "The maximum number of pods to scale up for the Istio ingress gateway. This limits the resources used and manages the scaling behavior."
  default     = 9
}

#########################
#  PROMETHEUS CONFIGS   #
#########################

variable "enable_prometheus_stack" {
  type        = bool
  description = ""
  default     = true
}

variable "grafana_virtual_service_host" {
  type        = string
  description = "The hostname for the Grafana virtual service, used in Istio routing. This host is used to access Grafana dashboards for monitoring metrics."
  default     = "grafana.k8s.raj.ninja"
}

variable "kiali_virtual_service_host" {
  type        = string
  description = "The hostname for the Kiali virtual service, a part of Istio's service mesh visualization. It provides insights into the mesh topology and performance."
  default     = "kiali.k8s.raj.ninja"
}

variable "enable_jaeger" {
  type        = bool
  description = "Flag to create jaeger standalone stack"
  default     = false
}

variable "jaeger_virtual_service_host" {
  type        = string
  description = "The hostname for the Jaeger virtual service, used for tracing and monitoring microservices within the Istio service mesh."
  default     = "jaeger.k8s.raj.ninja"
}

#################################
#  MANAGED PROMETHEUS CONFIGS   #
#################################

variable "enable_managed_prometheus" {
  type        = bool
  description = "Determines if the managed Prometheus service should be enabled. Managed Prometheus provides a fully managed monitoring service compatible with Prometheus."
  default     = false
}

variable "managed_prometheus_access_type" {
  type        = string
  description = "Specifies the access type for managed Prometheus. 'CURRENT_ACCOUNT' limits access to the current AWS account, ensuring isolated and secure access to the monitoring data."
  default     = "CURRENT_ACCOUNT"
}

variable "managed_grafana_permission_type" {
  type        = string
  description = "Defines the permission model for managed Grafana. 'SERVICE_MANAGED' allows AWS to manage permissions, simplifying the setup and management of Grafana."
  default     = "SERVICE_MANAGED"
}

variable "managed_grafana_authentication_providers" {
  type        = list(string)
  description = "A list of authentication providers for managed Grafana. For example, 'SAML' can be used for integrating with identity providers, ensuring secure and centralized user management."
  default     = ["SAML"]
}

variable "managed_grafana_datasources" {
  type        = list(string)
  description = "Specifies the data sources that managed Grafana can access. Includes options like 'CLOUDWATCH', 'PROMETHEUS', and 'XRAY', providing a wide range of data for comprehensive monitoring solutions."
  default     = ["CLOUDWATCH", "PROMETHEUS", "XRAY"]
}

variable "managed_grafana_notification_destinations" {
  type        = list(string)
  description = "Lists the notification channels supported by managed Grafana. For instance, 'SNS' allows Grafana to send alerts and notifications through AWS Simple Notification Service."
  default     = ["SNS"]
}


###############################
###  ARGO-CD CONFIGS  ###
###############################

variable "enable_argocd" {
  type    = bool
  default = true
}

variable "argocd_virtual_service_host" {
  type    = string
  default = "argo.k8s.raj.ninja"
}

###############################
###  CHART MUSEUM CONFIGS   ###
###############################

variable "enable_chart_museum" {
  type    = bool
  default = true
}

###############################
###  ARGO-ROLLOUTS CONFIGS  ###
###############################

variable "argo_rollouts_virtual_service_host" {
  type        = string
  description = "The hostname for the Argo Rollouts virtual service, used for advanced deployment capabilities like canary and blue-green deployments in Kubernetes."
  default     = "argo-rollouts.k8s.raj.ninja"
}

variable "argo_rollouts_expose_dashboard" {
  type        = bool
  description = "Enable expose Argo Rollouts Dashboards"
  default     = false
}

#########################
###  GENERAL TOGGLES  ###
#########################

variable "descheduler_toggle" {
  type        = bool
  description = "Controls the installation of the Descheduler, a tool to balance and optimize the distribution of Pods across the cluster for improved efficiency."
  default     = false
}

variable "chaos_mesh_toggle" {
  type        = bool
  description = "Determines whether to install Chaos Mesh, a cloud-native Chaos Engineering platform that orchestrates chaos experiments on Kubernetes environments."
  default     = false
}

variable "node_termination_handler_toggle" {
  type        = bool
  description = "Enables the AWS Node Termination Handler, which ensures that Kubernetes workloads are gracefully handled during EC2 instance terminations or disruptions."
  default     = false
}

variable "argo_rollouts_toggle" {
  type        = bool
  description = "Enables the installation of Argo Rollouts, providing advanced deployment strategies like Canary and Blue-Green deployments in Kubernetes."
  default     = true
}

variable "keda_toggle" {
  type        = bool
  description = "Activates the installation of KEDA (Kubernetes Event-Driven Autoscaling), which adds event-driven scaling capabilities to Kubernetes workloads."
  default     = true
}

#########################
###   ADDONS CONFIGS  ###
#########################

variable "addon_cni_version" {
  type        = string
  description = "Specifies the version of the AWS VPC CNI (Container Network Interface) plugin to use, which manages the network interfaces for pod networking."
  default     = "v1.18.3-eksbuild.2"
}

variable "addon_coredns_version" {
  type        = string
  description = "Defines the version of CoreDNS to use, a DNS server/forwarder that is integral to internal Kubernetes DNS resolution."
  default     = "v1.11.3-eksbuild.1"
}

variable "addon_kubeproxy_version" {
  type        = string
  description = "Sets the version of Kubeproxy to be used, which handles Kubernetes network services like forwarding the requests to correct containers."
  default     = "v1.31.0-eksbuild.5"
}

variable "addon_csi_version" {
  type        = string
  description = "Indicates the version of the Container Storage Interface (CSI) driver to use for managing storage volumes in Kubernetes."
  default     = "v1.35.0-eksbuild.1"
}

variable "default_tags" {
  type        = map(string)
  description = "A map of default tags to apply to all resources. These tags can help with identifying and organizing resources within the AWS environment."
  default = {
    Environment = "prod"
    Foo         = "Bar"
    Ping        = "Pong"
  }
}
