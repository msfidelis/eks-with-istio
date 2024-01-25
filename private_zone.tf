resource "aws_route53_zone" "private" {
  name = var.cluster_private_zone

  vpc {
    vpc_id = aws_vpc.cluster_vpc.id
  }
}

resource "aws_route53_record" "nlb" {
  zone_id = aws_route53_zone.private.zone_id
  name    = format("*.%s", var.cluster_private_zone)
  type    = "CNAME"
  ttl     = "30"
  records = [aws_lb.ingress.dns_name]
}