# Variables
variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "policy_name" {
  type        = string
  description = "Name of the IAM policy"
}

variable "source_bucket_arn" {
  type        = string
  description = "ARN of the source bucket"
}

variable "destination_bucket_arn" {
  type        = string
  description = "ARN of the destination bucket"
}