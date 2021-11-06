<h1 align="center">Welcome to EKS with Istio Setup with Terraform 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-v0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="/" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="/LICENSE " target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/fidelissauro" target="_blank">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" />
  </a>
</p>

## Terraform Versions Compatibility
<p>
  <a href="/" target="_blank">
    <img alt="Terraform 0.12" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.12.*/badge.svg" />
  </a>
  <a href="/" target="_blank">
    <img alt="Terraform 0.13" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.13.*/badge.svg" />
  </a>
  <a href="/" target="_blank">
    <img alt="Terraform 0.14" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.14.*/badge.svg" />
  </a> 
  <a href="/" target="_blank">
    <img alt="Terraform 0.15" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%200.15.*/badge.svg" />
  </a>
  <a href="/" target="_blank">
    <img alt="Terraform 1.0.0" src="https://github.com/msfidelis/eks-with-istio/workflows/Terraform%201.0.*/badge.svg" />
  </a> 
</p>


### 🏠 [Architecture / Topology](/)

![topology](/samples/img/Architecture.png)

# Components / Stack 

| Provider          | Version |
|---------------------|---------|
| Terraform           | 0.12+   |
| Istio Base          | 1.11.0  |
| Istio Ingress       | 1.11.0  |
| Istio Egress        | 1.11.0  |
| Istio Discovery     | 1.11.0  |
| Cluster Autoscaler  | v1.21.0 |
| Chaos Mesh          |         |
| Descheduler         |         |
| Kube State Metrics  |         |
| Metrics Server (HPA)|         |
| Prometheus Stack    |         |

# Providers

| Components          | Version |
|---------------------|---------|
| AWS                 | v3.37.0+|
| Helm                | v2.1.1+ |
| Kubernetes          | v2.1.0+ |
| TLS                 | v3.1.0+ | 


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
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
