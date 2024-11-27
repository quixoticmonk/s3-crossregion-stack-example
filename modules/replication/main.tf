# Replication configuration for source bucket
resource "aws_s3_bucket_replication_configuration" "this" {

  role   = aws_iam_role.replication.arn
  bucket = var.source_bucket_arn

  rule {
    id     = "replication_rule"
    status = "Enabled"

    destination {
      bucket        = var.destination_bucket_arn
      storage_class = var.destination_storage_class
    }
  }
}


# IAM Role for replication
resource "aws_iam_role" "replication" {
  name  = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for replication
resource "aws_iam_policy" "replication" {
  name  = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.this.arn
        ]
      },
      {
        Action = [
          "s3:GetObjectVersionForReplication",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.this.arn}/*"
        ]
      },
      {
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ]
        Effect = "Allow"
        Resource = [
          "${var.destination_bucket_arn}/*"
        ]
      }
    ]
  })
}

# Attach policy to IAM role
resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}


