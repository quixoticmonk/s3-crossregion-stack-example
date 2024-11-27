
# Outputs
output "role_arn" {
  value       = aws_iam_role.replication.arn
  description = "ARN of the created IAM role"
}
