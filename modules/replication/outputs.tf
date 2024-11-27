output "role_arn" {
  value       = try(aws_iam_role.replication.arn, null)
  description = "ARN of the created IAM role"
}