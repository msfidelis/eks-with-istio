resource "aws_lb" "ingress" {
    name               = var.cluster_name
    internal           = var.nlb_ingress_internal
    load_balancer_type = var.nlb_ingress_type

    subnets            = [
        aws_subnet.public_subnet_1a.id,
        aws_subnet.public_subnet_1b.id,
        aws_subnet.public_subnet_1c.id
    ]

    enable_deletion_protection          = var.nlb_ingress_enable_termination_protection
    enable_cross_zone_load_balancing    = var.enable_cross_zone_load_balancing
    
    tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
}

resource "aws_lb_target_group" "http" {
    name                = format("%s-http", var.cluster_name)
    port                = 30080
    protocol            = "TCP"
    vpc_id              = aws_vpc.cluster_vpc.id
    proxy_protocol_v2   = var.proxy_protocol_v2
}

resource "aws_lb_target_group" "https" {
    name                = format("%s-https", var.cluster_name)
    port                = 30443
    protocol            = "TCP"
    vpc_id              = aws_vpc.cluster_vpc.id
    proxy_protocol_v2   = var.proxy_protocol_v2
}

resource "aws_lb_listener" "ingress_443" {
    load_balancer_arn = aws_lb.ingress.arn
    port              = "443"
    protocol          = "TCP"
    # protocol          = "TLS"
    # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
    # alpn_policy       = "HTTP2Preferred"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.https.arn
    }
}

resource "aws_lb_listener" "ingress_80" {
    load_balancer_arn = aws_lb.ingress.arn
    port              = "80"
    protocol          = "TCP"
    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.http.arn
    }
}

resource "aws_api_gateway_vpc_link" "nlb" {
  name        = var.cluster_name
  description = var.cluster_name
  target_arns = [ aws_lb.ingress.arn ]
}
