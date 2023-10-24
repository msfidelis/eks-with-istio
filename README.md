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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
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
| [aws_eip.vpc_iep](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.keda_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.aws_node_termination_handler_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.cluster_autoscaler](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.keda](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.alb_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.aws_node_termination_handler_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cluster_autoscaler_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.keda_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
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
| [aws_lb.ingress](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.ingress_443](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.ingress_80](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.http](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.https](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
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
| [helm_release.keda](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kiali-server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics_server](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.node_termination_handler](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.grafana_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.grafana_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_http](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_target_group_binding_https](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.jaeger_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.jaeger_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kiali_gateway](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kiali_virtual_service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
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
| [aws_iam_policy_document.keda_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.keda_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | VPC CNI Version | `string` | `"v1.14.1-eksbuild.1"` | no |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | CoreDNS Version | `string` | `"v1.10.1-eksbuild.4"` | no |
| <a name="input_addon_csi_version"></a> [addon\_csi\_version](#input\_addon\_csi\_version) | CSI Version | `string` | `"v1.24.0-eksbuild.1"` | no |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | Kubeproxy Version | `string` | `"v1.28.1-eksbuild.1"` | no |
| <a name="input_argo_rollouts_toggle"></a> [argo\_rollouts\_toggle](#input\_argo\_rollouts\_toggle) | Enable Argo Rollouts Installation | `bool` | `true` | no |
| <a name="input_auto_scale_options"></a> [auto\_scale\_options](#input\_auto\_scale\_options) | n/a | `map` | <pre>{<br>  "desired": 6,<br>  "max": 10,<br>  "min": 4<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_chaos_mesh_toggle"></a> [chaos\_mesh\_toggle](#input\_chaos\_mesh\_toggle) | Enable Chaos Mesh Installation | `bool` | `false` | no |
| <a name="input_cluster_autoscaler_toggle"></a> [cluster\_autoscaler\_toggle](#input\_cluster\_autoscaler\_toggle) | Enable Cluster Autoscaler Installation | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"eks-cluster"` | no |
| <a name="input_cluster_private_zone"></a> [cluster\_private\_zone](#input\_cluster\_private\_zone) | n/a | `string` | `"k8s.cluster"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map` | <pre>{<br>  "Environment": "prod",<br>  "Foo": "Bar",<br>  "Ping": "Pong"<br>}</pre> | no |
| <a name="input_descheduler_toggle"></a> [descheduler\_toggle](#input\_descheduler\_toggle) | Enable Descheduler Installation | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | n/a | `bool` | `false` | no |
| <a name="input_grafana_virtual_service_host"></a> [grafana\_virtual\_service\_host](#input\_grafana\_virtual\_service\_host) | n/a | `string` | `"grafana.k8s.raj.ninja"` | no |
| <a name="input_istio_ingress_max_pods"></a> [istio\_ingress\_max\_pods](#input\_istio\_ingress\_max\_pods) | Maximum pods for istio-ingress-gateway | `number` | `9` | no |
| <a name="input_istio_ingress_min_pods"></a> [istio\_ingress\_min\_pods](#input\_istio\_ingress\_min\_pods) | Minimum pods for istio-ingress-gateway | `number` | `3` | no |
| <a name="input_jaeger_virtual_service_host"></a> [jaeger\_virtual\_service\_host](#input\_jaeger\_virtual\_service\_host) | n/a | `string` | `"jaeger.k8s.raj.ninja"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `string` | `"1.28"` | no |
| <a name="input_keda_toggle"></a> [keda\_toggle](#input\_keda\_toggle) | Enable Keda Installation | `bool` | `true` | no |
| <a name="input_kiali_virtual_service_host"></a> [kiali\_virtual\_service\_host](#input\_kiali\_virtual\_service\_host) | n/a | `string` | `"kiali.k8s.raj.ninja"` | no |
| <a name="input_nlb_ingress_enable_termination_protection"></a> [nlb\_ingress\_enable\_termination\_protection](#input\_nlb\_ingress\_enable\_termination\_protection) | n/a | `bool` | `false` | no |
| <a name="input_nlb_ingress_internal"></a> [nlb\_ingress\_internal](#input\_nlb\_ingress\_internal) | n/a | `bool` | `false` | no |
| <a name="input_nlb_ingress_type"></a> [nlb\_ingress\_type](#input\_nlb\_ingress\_type) | n/a | `string` | `"network"` | no |
| <a name="input_node_termination_handler_toggle"></a> [node\_termination\_handler\_toggle](#input\_node\_termination\_handler\_toggle) | Enable AWS Node Termination Handler Setup | `bool` | `true` | no |
| <a name="input_nodes_instances_sizes"></a> [nodes\_instances\_sizes](#input\_nodes\_instances\_sizes) | n/a | `list` | <pre>[<br>  "t3.large"<br>]</pre> | no |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | n/a | `bool` | `false` | no |

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