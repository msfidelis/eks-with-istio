resource "aws_eks_node_group" "cluster" {
  
    cluster_name    = aws_eks_cluster.eks_cluster.name
    node_group_name = format("%s-node-group", aws_eks_cluster.eks_cluster.name)
    node_role_arn   = aws_iam_role.eks_nodes_roles.arn

    subnet_ids = [
        aws_subnet.private_subnet_1a.id,
        aws_subnet.private_subnet_1b.id,
        aws_subnet.private_subnet_1c.id
    ]

    instance_types      = var.nodes_instances_sizes

    scaling_config {
        desired_size    = lookup(var.auto_scale_options, "desired")
        max_size        = lookup(var.auto_scale_options, "max")
        min_size        = lookup(var.auto_scale_options, "min")
    }

    labels = {
        "ingress/ready" = "true"
    }

    tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }

}