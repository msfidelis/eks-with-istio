resource "aws_s3_bucket" "museum" {
  count  = var.enable_chart_museum ? 1 : 0
  bucket = format("%s-%s-chartmuseum-repo", var.cluster_name, data.aws_caller_identity.current.account_id)
}

resource "aws_s3_bucket_ownership_controls" "museum" {
  count  = var.enable_chart_museum ? 1 : 0
  bucket = aws_s3_bucket.museum[count.index].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "museum" {
  count                   = var.enable_chart_museum ? 1 : 0
  bucket                  = aws_s3_bucket.museum[count.index].bucket
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_ownership_controls.museum]
}

resource "aws_s3_bucket_acl" "museum" {
  count  = var.enable_chart_museum ? 1 : 0
  bucket = aws_s3_bucket.museum[count.index].bucket
  acl    = "private"

  depends_on = [aws_s3_bucket_public_access_block.museum]
}

resource "aws_s3_bucket_object" "demo_chart" {
  count  = var.enable_chart_museum ? 1 : 0
  bucket = aws_s3_bucket.museum[count.index].bucket
  key    = "sample-0.1.0.tgz"
  source = "${path.module}/helm/sample-0.1.0.tgz"
  etag   = filemd5("${path.module}/helm/sample-0.1.0.tgz")

  depends_on = [
    aws_s3_bucket_acl.museum
  ]
}