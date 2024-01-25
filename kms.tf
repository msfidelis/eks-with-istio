resource "aws_kms_key" "eks" {
  description = var.cluster_name
}

resource "aws_kms_alias" "eks" {
  name          = format("alias/%s", var.cluster_name)
  target_key_id = aws_kms_key.eks.key_id
}