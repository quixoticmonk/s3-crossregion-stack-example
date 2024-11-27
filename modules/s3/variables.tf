variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "is_source" {
  type        = bool
  description = "Whether this is a source bucket for replication"
  default     = false
}

variable "replication_role_arn" {
  type        = string
  description = "ARN of the IAM role for replication"
  default     = null
}

variable "destination_bucket_arn" {
  type        = string
  description = "ARN of the destination bucket for replication"
  default     = null
}

variable "destination_storage_class" {
  type        = string
  description = "Storage class for replicated objects"
  default     = "STANDARD"
}


# Variables
variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "policy_name" {
  type        = string
  description = "Name of the IAM policy"
}