# Variables
variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "policy_name" {
  type        = string
  description = "Name of the IAM policy"
}

variable "source_bucket" {
  type        = string
  description = "Name of the source bucket"
}

variable "source_bucket_arn" {
  type        = string
  description = "ARN of the source bucket"
}

variable "destination_bucket_arn" {
  type        = string
  description = "ARN of the destination bucket"
}

variable "destination_storage_class" {
  type        = string
  description = "Storage class for replicated objects"
  default     = "STANDARD"
}
