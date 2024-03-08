output "istio_ingress_vpclink" {
  value = aws_lb.ingress.dns_name
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}