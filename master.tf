
resource "aws_eks_cluster" "eks_cluster" {

    name        = var.cluster_name
    version     = var.k8s_version
    role_arn    = aws_iam_role.eks_cluster_role.arn

    vpc_config {

        security_group_ids = [
            aws_security_group.cluster_master_sg.id
        ]

        subnet_ids = [
            aws_subnet.pods_subnet_1a.id,
            aws_subnet.pods_subnet_1b.id,
            aws_subnet.pods_subnet_1c.id
        ]

    }

    # encryption_config {
    #     provider {
    #         key_arn     = aws_kms_key.eks.arn
    #     }
    #     resources   = ["secrets"]
    # }   

    tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }

}

resource "aws_security_group" "cluster_master_sg" {
    name = format("%s-master-sg", var.cluster_name)
    vpc_id = aws_vpc.cluster_vpc.id

    egress {
        from_port   = 0
        to_port     = 0

        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        Name = format("%s-master-sg", var.cluster_name)
    }

}

resource "aws_security_group_rule" "cluster_ingress_https" {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    security_group_id = aws_security_group.cluster_master_sg.id
    type = "ingress"
}