output "istio_ingress_vpclink" {
  value = aws_lb.ingress.dns_name
}