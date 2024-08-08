<!-- BEGIN_TF_DOCS -->
<h1 align="center">Welcome to EKS with Istio Setup with Terraform 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-v0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="/" target="\_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="/LICENSE " target="\_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/fidelissauro" target="\_blank">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" />
  </a>
</p>

## Terraform Versions Compatibility
<p>
  <a href="/" target="\_blank">
    <img alt="Terraform 0.13" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.13.*/badge.svg" />
  </a>
  <a href="/" target="\_blank">
    <img alt="Terraform 0.14" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.14.*/badge.svg" />
  </a>
  <a href="/" target="\_blank">
    <img alt="Terraform 0.15" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.15.*/badge.svg" />
  </a>
  <a href="/" target="\_blank">
    <img alt="Terraform 1.0.0" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%201.0.*/badge.svg" />
  </a>
  <a href="/" target="\_blank">
    <img alt="Terraform 1.1.0" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%201.1.*/badge.svg" />
  </a>   
</p>

### 🏠 [Architecture / Topology](/)

![topology](/samples/img/Architecture.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.61.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.14.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.31.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_vpc_link.nlb](https://registry.terraform.io/providers/aws/latest/docs/resources/api_gateway_vpc_link) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_instance_terminate](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_rebalance](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_scheduled_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_spot_termination](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.node_termination_handler_state_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_instance_terminate](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_rebalance](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_scheduled_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_spot_termination](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.node_termination_handler_state_change](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.prometheus](https://registry.terraform.io/providers/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eip.vpc_iep](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.main](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_grafana_workspace.grafana](https://registry.terraform.io/providers/aws/latest/docs/resources/grafana_workspace) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.keda_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.managed_prometheus_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.cluster_autoscaler](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.keda](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.managed_prometheus_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.alb_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.aws_node_termination_handler_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cluster_autoscaler_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.grafana](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.karpenter_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.keda_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.managed_prometheus_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_alias.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_key) | resource |
| [aws_launch_template.karpenter](https://registry.terraform.io/providers/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.ingress](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.ingress_443](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.ingress_80](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.http](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.https](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_prometheus_workspace.main](https://registry.terraform.io/providers/aws/latest/docs/resources/prometheus_workspace) | resource |
| [aws_route.nat_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route53_record.nlb](https://registry.terraform.io/providers/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route_table.igw_route_table](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.pods_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pods_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pods_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.cluster_nodes_sg](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.cluster_sg](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cluster_ingress_https](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster_udp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_sqs_queue.node_termination_handler](https://registry.terraform.io/providers/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.node_termination_handler](https://registry.terraform.io/providers/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_subnet.pods_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pods_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pods_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.cluster_vpc](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.pods](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.argo_rollouts](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.chaos_mesh](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.cluster_autoscaler](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.descheduler](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_base](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_ingress](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.jaeger](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.karpenter](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.keda](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kiali-server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.managed_prometheus](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.node_termination_handler](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.grafana_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_http](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_https](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.jaeger_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.jaeger_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter_provisioner](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.karpenter_template](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kiali_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kiali_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.rollouts_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.rollouts_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws-auth](https://registry.terraform.io/providers/kubernetes/latest/docs/resources/config_map) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_node_termination_handler_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.keda_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.keda_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.managed_prometheus_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.managed_prometheus_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.eks](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | Specifies the version of the AWS VPC CNI (Container Network Interface) plugin to use, which manages the network interfaces for pod networking. | `string` | `"v1.18.3-eksbuild.1"` | no |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | Defines the version of CoreDNS to use, a DNS server/forwarder that is integral to internal Kubernetes DNS resolution. | `string` | `"v1.11.1-eksbuild.9"` | no |
| <a name="input_addon_csi_version"></a> [addon\_csi\_version](#input\_addon\_csi\_version) | Indicates the version of the Container Storage Interface (CSI) driver to use for managing storage volumes in Kubernetes. | `string` | `"v1.26.1-eksbuild.1"` | no |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | Sets the version of Kubeproxy to be used, which handles Kubernetes network services like forwarding the requests to correct containers. | `string` | `"v1.30.0-eksbuild.3"` | no |
| <a name="input_argo_rollouts_toggle"></a> [argo\_rollouts\_toggle](#input\_argo\_rollouts\_toggle) | Enables the installation of Argo Rollouts, providing advanced deployment strategies like Canary and Blue-Green deployments in Kubernetes. | `bool` | `true` | no |
| <a name="input_argo_rollouts_virtual_service_host"></a> [argo\_rollouts\_virtual\_service\_host](#input\_argo\_rollouts\_virtual\_service\_host) | The hostname for the Argo Rollouts virtual service, used for advanced deployment capabilities like canary and blue-green deployments in Kubernetes. | `string` | `"argo-rollouts.k8s.raj.ninja"` | no |
| <a name="input_auto_scale_options"></a> [auto\_scale\_options](#input\_auto\_scale\_options) | Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes. | `map` | <pre>{<br>  "desired": 6,<br>  "max": 10,<br>  "min": 4<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside. | `string` | `"us-east-1"` | no |
| <a name="input_chaos_mesh_toggle"></a> [chaos\_mesh\_toggle](#input\_chaos\_mesh\_toggle) | Determines whether to install Chaos Mesh, a cloud-native Chaos Engineering platform that orchestrates chaos experiments on Kubernetes environments. | `bool` | `false` | no |
| <a name="input_cluster_autoscaler_toggle"></a> [cluster\_autoscaler\_toggle](#input\_cluster\_autoscaler\_toggle) | Enable or disable the Cluster Autoscaler installation. When true, Cluster Autoscaler is installed to automatically adjust the number of nodes in the cluster. | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region. | `string` | `"eks-cluster"` | no |
| <a name="input_cluster_private_zone"></a> [cluster\_private\_zone](#input\_cluster\_private\_zone) | The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster. | `string` | `"k8s.cluster"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to apply to all resources. These tags can help with identifying and organizing resources within the AWS environment. | `map(string)` | <pre>{<br>  "Environment": "prod",<br>  "Foo": "Bar",<br>  "Ping": "Pong"<br>}</pre> | no |
| <a name="input_descheduler_toggle"></a> [descheduler\_toggle](#input\_descheduler\_toggle) | Controls the installation of the Descheduler, a tool to balance and optimize the distribution of Pods across the cluster for improved efficiency. | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | Controls whether cross-zone load balancing is enabled for the Network Load Balancer, allowing even traffic distribution across all zones. | `bool` | `false` | no |
| <a name="input_enable_managed_prometheus"></a> [enable\_managed\_prometheus](#input\_enable\_managed\_prometheus) | Determines if the managed Prometheus service should be enabled. Managed Prometheus provides a fully managed monitoring service compatible with Prometheus. | `bool` | `false` | no |
| <a name="input_enable_prometheus_stack"></a> [enable\_prometheus\_stack](#input\_enable\_prometheus\_stack) | n/a | `bool` | `true` | no |
| <a name="input_enable_vpc_link"></a> [enable\_vpc\_link](#input\_enable\_vpc\_link) | Create VPC Link associated to Network Load Balancing | `bool` | `true` | no |
| <a name="input_grafana_virtual_service_host"></a> [grafana\_virtual\_service\_host](#input\_grafana\_virtual\_service\_host) | The hostname for the Grafana virtual service, used in Istio routing. This host is used to access Grafana dashboards for monitoring metrics. | `string` | `"grafana.k8s.raj.ninja"` | no |
| <a name="input_istio_ingress_max_pods"></a> [istio\_ingress\_max\_pods](#input\_istio\_ingress\_max\_pods) | The maximum number of pods to scale up for the Istio ingress gateway. This limits the resources used and manages the scaling behavior. | `number` | `9` | no |
| <a name="input_istio_ingress_min_pods"></a> [istio\_ingress\_min\_pods](#input\_istio\_ingress\_min\_pods) | The minimum number of pods to maintain for the Istio ingress gateway. This ensures basic availability and load handling. | `number` | `3` | no |
| <a name="input_jaeger_virtual_service_host"></a> [jaeger\_virtual\_service\_host](#input\_jaeger\_virtual\_service\_host) | The hostname for the Jaeger virtual service, used for tracing and monitoring microservices within the Istio service mesh. | `string` | `"jaeger.k8s.raj.ninja"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The version of Kubernetes to use for the EKS cluster. This version should be compatible with the AWS EKS service and other infrastructure components. | `string` | `"1.30"` | no |
| <a name="input_karpenter_availability_zones"></a> [karpenter\_availability\_zones](#input\_karpenter\_availability\_zones) | A list of AWS availability zones where Karpenter should launch nodes. These zones should be in the same region as the EKS cluster. | `list(any)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_karpenter_capacity_type"></a> [karpenter\_capacity\_type](#input\_karpenter\_capacity\_type) | Defines the capacity types for provisioning instances in the cluster, such as 'spot' or 'on\_demand', offering cost-saving options or consistent availability respectively. | `list(any)` | <pre>[<br>  "spot"<br>]</pre> | no |
| <a name="input_karpenter_instance_family"></a> [karpenter\_instance\_family](#input\_karpenter\_instance\_family) | Defines a list of EC2 instance families to be considered by Karpenter for node provisioning. Instance families like 'c6' and 'c5' offer different compute capabilities. | `list(any)` | <pre>[<br>  "c6",<br>  "c6a",<br>  "c5"<br>]</pre> | no |
| <a name="input_karpenter_instance_sizes"></a> [karpenter\_instance\_sizes](#input\_karpenter\_instance\_sizes) | Specifies a list of instance sizes within the chosen instance families to allow diversity in the provisioned nodes by Karpenter. | `list(any)` | <pre>[<br>  "large",<br>  "2xlarge"<br>]</pre> | no |
| <a name="input_karpenter_toggle"></a> [karpenter\_toggle](#input\_karpenter\_toggle) | Determines whether Karpenter is enabled for the EKS cluster. Karpenter is an open-source auto-scaler for Kubernetes clusters. | `bool` | `true` | no |
| <a name="input_keda_toggle"></a> [keda\_toggle](#input\_keda\_toggle) | Activates the installation of KEDA (Kubernetes Event-Driven Autoscaling), which adds event-driven scaling capabilities to Kubernetes workloads. | `bool` | `true` | no |
| <a name="input_kiali_virtual_service_host"></a> [kiali\_virtual\_service\_host](#input\_kiali\_virtual\_service\_host) | The hostname for the Kiali virtual service, a part of Istio's service mesh visualization. It provides insights into the mesh topology and performance. | `string` | `"kiali.k8s.raj.ninja"` | no |
| <a name="input_managed_grafana_authentication_providers"></a> [managed\_grafana\_authentication\_providers](#input\_managed\_grafana\_authentication\_providers) | A list of authentication providers for managed Grafana. For example, 'SAML' can be used for integrating with identity providers, ensuring secure and centralized user management. | `list(string)` | <pre>[<br>  "SAML"<br>]</pre> | no |
| <a name="input_managed_grafana_datasources"></a> [managed\_grafana\_datasources](#input\_managed\_grafana\_datasources) | Specifies the data sources that managed Grafana can access. Includes options like 'CLOUDWATCH', 'PROMETHEUS', and 'XRAY', providing a wide range of data for comprehensive monitoring solutions. | `list(string)` | <pre>[<br>  "CLOUDWATCH",<br>  "PROMETHEUS",<br>  "XRAY"<br>]</pre> | no |
| <a name="input_managed_grafana_notification_destinations"></a> [managed\_grafana\_notification\_destinations](#input\_managed\_grafana\_notification\_destinations) | Lists the notification channels supported by managed Grafana. For instance, 'SNS' allows Grafana to send alerts and notifications through AWS Simple Notification Service. | `list(string)` | <pre>[<br>  "SNS"<br>]</pre> | no |
| <a name="input_managed_grafana_permission_type"></a> [managed\_grafana\_permission\_type](#input\_managed\_grafana\_permission\_type) | Defines the permission model for managed Grafana. 'SERVICE\_MANAGED' allows AWS to manage permissions, simplifying the setup and management of Grafana. | `string` | `"SERVICE_MANAGED"` | no |
| <a name="input_managed_prometheus_access_type"></a> [managed\_prometheus\_access\_type](#input\_managed\_prometheus\_access\_type) | Specifies the access type for managed Prometheus. 'CURRENT\_ACCOUNT' limits access to the current AWS account, ensuring isolated and secure access to the monitoring data. | `string` | `"CURRENT_ACCOUNT"` | no |
| <a name="input_nlb_ingress_enable_termination_protection"></a> [nlb\_ingress\_enable\_termination\_protection](#input\_nlb\_ingress\_enable\_termination\_protection) | Determines if termination protection is enabled for the Network Load Balancer, preventing accidental deletion. | `bool` | `false` | no |
| <a name="input_nlb_ingress_internal"></a> [nlb\_ingress\_internal](#input\_nlb\_ingress\_internal) | Indicates whether the Network Load Balancer (NLB) for the EKS cluster should be internal, restricting access to within the AWS network. | `bool` | `false` | no |
| <a name="input_nlb_ingress_type"></a> [nlb\_ingress\_type](#input\_nlb\_ingress\_type) | Specifies the type of ingress to be used, such as 'network', determining how the NLB handles incoming traffic to the EKS cluster. | `string` | `"network"` | no |
| <a name="input_node_termination_handler_toggle"></a> [node\_termination\_handler\_toggle](#input\_node\_termination\_handler\_toggle) | Enables the AWS Node Termination Handler, which ensures that Kubernetes workloads are gracefully handled during EC2 instance terminations or disruptions. | `bool` | `true` | no |
| <a name="input_nodes_instances_sizes"></a> [nodes\_instances\_sizes](#input\_nodes\_instances\_sizes) | A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload. | `list` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | Enables or disables Proxy Protocol v2 on the Network Load Balancer, used for preserving client IP addresses and other connection information. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_istio_ingress_vpclink"></a> [istio\_ingress\_vpclink](#output\_istio\_ingress\_vpclink) | n/a |

### ✨ [Demo](/)

## Install

```sh
terraform apply
```

## Usage

```sh
terraform apply
```

## Run tests

```sh
terraform plan
```

## Author

👤 **Matheus Fidelis**

* Website: https://raj.ninja
* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)
* LinkedIn: [@msfidelis](https://linkedin.com/in/msfidelis)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2021 [Matheus Fidelis](https://github.com/msfidelis).<br />
This project is [MIT](/LICENSE ) licensed.

***
\_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)\_
<!-- END_TF_DOCS -->


