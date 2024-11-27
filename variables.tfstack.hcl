variable "identity_token" { 
  type      = string 
  ephemeral = true
}

variable "role_arn" {
  type = string
  ephemeral=true
}

variable "source_bucket_name" {
    type = string
}

variable "destination_bucket_name" {
    type = string
}

variable "suffix" {
    type = string
}

variable "replication_role" {
  type = string
}

variable "replication_policy" {
  type = string
}