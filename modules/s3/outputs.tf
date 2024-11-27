
output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "ARN of the created bucket"
}

output "bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "ID of the created bucket"
}

output "role_arn" {
  value       = try(aws_iam_role.replication[0].arn, null)
  description = "ARN of the created IAM role"
}