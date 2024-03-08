
resource "aws_eks_cluster" "main" {

  name     = var.cluster_name
  version  = var.k8s_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    security_group_ids = [
      aws_security_group.cluster_sg.id,
      aws_security_group.cluster_nodes_sg.id
    ]

    subnet_ids = [
      aws_subnet.private_subnet_1a.id,
      aws_subnet.private_subnet_1b.id,
      aws_subnet.private_subnet_1c.id
    ]

  }

  encryption_config {
    provider {
      key_arn = aws_kms_key.eks.arn
    }
    resources = ["secrets"]
  }

  enabled_cluster_log_types = [
    "api", "audit", "authenticator", "controllerManager", "scheduler"
  ]

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}"     = "shared"
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned",
    "k8s.io/cluster-autoscaler/enabled"             = true
  }

}

resource "aws_security_group" "cluster_sg" {
  name   = format("%s-sg", var.cluster_name)
  vpc_id = aws_vpc.cluster_vpc.id

  egress {
    from_port = 0
    to_port   = 0

    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-sg", var.cluster_name)
  }

}

resource "aws_security_group_rule" "cluster_ingress_https" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"

  security_group_id = aws_security_group.cluster_sg.id
  type              = "ingress"
}

resource "aws_security_group_rule" "nodeport_cluster" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport"
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "nodeport_cluster_udp" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport"
  protocol    = "udp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}