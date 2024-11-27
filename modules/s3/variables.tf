variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "destination_bucket_arn" {
  type        = string
  description = "ARN of the destination bucket for replication"
  default     = null
}
