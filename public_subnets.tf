resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block                = "10.0.0.0/20"
  map_public_ip_on_launch   = true
  availability_zone     = format("%sa", var.aws_region)

  tags = {
      "Name" = format("%s-public-1a", var.cluster_name),
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block                = "10.0.16.0/20"
  map_public_ip_on_launch   = true
  availability_zone     = format("%sb", var.aws_region)

  tags = {
      "Name" = format("%s-public-1b", var.cluster_name),
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id = aws_vpc.cluster_vpc.id

  cidr_block                = "10.0.32.0/20"
  map_public_ip_on_launch   = true
  availability_zone     = format("%sc", var.aws_region)

  tags = {
        "Name" = format("%s-public-1c", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id         = aws_subnet.public_subnet_1a.id
  route_table_id    = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id         = aws_subnet.public_subnet_1b.id
  route_table_id    = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id         = aws_subnet.public_subnet_1c.id
  route_table_id    = aws_route_table.igw_route_table.id
}