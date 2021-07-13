resource "aws_vpc" "cluster_vpc" {
    cidr_block = "10.0.0.0/16"

    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name = format("%s-vpc", var.cluster_name)
    }
}

resource "aws_vpc_ipv4_cidr_block_association" "pods" {
  vpc_id     = aws_vpc.cluster_vpc.id
  cidr_block = "11.0.0.0/16"
}