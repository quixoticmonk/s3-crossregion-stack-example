output "role_arn" {
  value       = try(aws_iam_role.replication[0].arn, null)
  description = "ARN of the created IAM role"
}