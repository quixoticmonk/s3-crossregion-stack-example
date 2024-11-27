
output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "ARN of the created bucket"
}

output "bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "ID of the created bucket"
}
