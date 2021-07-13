resource "aws_subnet" "pods_subnet_1a" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block            = "11.0.0.0/20"
    availability_zone     = format("%sa", var.aws_region)

    tags = {
        "Name" = format("%s-pods-1a", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }

    depends_on = [
        aws_vpc_ipv4_cidr_block_association.pods
    ]
}

resource "aws_subnet" "pods_subnet_1b" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block            = "11.0.16.0/20"
    availability_zone     = format("%sb", var.aws_region)

    tags = {
        "Name" = format("%s-pods-1b", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }

    depends_on = [
        aws_vpc_ipv4_cidr_block_association.pods
    ]
}

resource "aws_subnet" "pods_subnet_1c" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block            = "11.0.32.0/20"
    availability_zone     = format("%sc", var.aws_region)

    tags = {
        "Name" = format("%s-pods-1c", var.cluster_name),
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }

    depends_on = [
        aws_vpc_ipv4_cidr_block_association.pods
    ]

}

resource "aws_route_table_association" "pods_1a" {
    subnet_id = aws_subnet.pods_subnet_1a.id
    route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "pods_1b" {
    subnet_id = aws_subnet.pods_subnet_1b.id
    route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "pods_1c" {
    subnet_id = aws_subnet.pods_subnet_1c.id
    route_table_id = aws_route_table.nat.id
}