component "source" {
  source = "./modules/s3"
  inputs = {
    bucket_name            = "${var.source_bucket_name}-${var.suffix}"
  }
  providers = {
    aws = provider.aws.source
  }
}

component "destination" {
  source = "./modules/s3"
  inputs = {
    bucket_name          = "${var.destination_bucket_name}-${var.suffix}"
  }
  providers = {
    aws = provider.aws.dest
  }
}


component "replication" {
  source = "./modules/replication"
  inputs = {
    role_name              = var.replication_role
    policy_name            = var.replication_policy
    source_bucket_arn      = component.source.bucket_arn
    destination_bucket_arn = component.destination.bucket_arn
    source_bucket          = component.source.bucket_id
  }
  providers = {
    aws = provider.aws.source
  }
}

component "bidirectional_replication" {
  source = "./modules/replication"
  inputs = {
    role_name              = "${var.replication_role}-bidirectional"
    policy_name            = "${var.replication_policy}-bidirectional"
    source_bucket_arn      = component.destination.bucket_arn
    destination_bucket_arn = component.source.bucket_arn
    source_bucket          = component.destination.bucket_id
  }
  providers = {
    aws = provider.aws.source
  }
}
