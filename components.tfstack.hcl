component "source" {
  source = "./modules/s3"
  inputs = {
    bucket_name            = "${var.source_bucket_name}-${var.prefix}"
    is_source              = true
    destination_bucket_arn = component.destination.bucket_arn
    role_name              = var.replication_role
    policy_name            = var.replication_policy
  }
  providers = {
    aws = provider.aws.source
  }
}

component "destination" {
  source = "./modules/s3"
  inputs = {
    bucket_name          = "${var.destination_bucket_name}-${var.prefix}"
    replication_role_arn = component.source.role_arn
  }
  providers = {
    aws = provider.aws.dest
  }
}
