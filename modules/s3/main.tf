# S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

# Enable versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Replication configuration for source bucket
resource "aws_s3_bucket_replication_configuration" "this" {
  count = var.is_source ? 1 : 0
  depends_on = [aws_s3_bucket_versioning.this]

  role   = var.replication_role_arn
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "replication_rule"
    status = "Enabled"

    destination {
      bucket        = var.destination_bucket_arn
      storage_class = var.destination_storage_class
    }
  }
}


