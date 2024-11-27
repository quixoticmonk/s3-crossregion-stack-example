identity_token "aws" {
  audience = ["aws.workload.identity"]
}

store "varset" "role_dev" {
  id       = "varset-6pcUK8q4FQVLBRJY"
  category = "env"
}

deployment "dev" {
  inputs = {
    identity_token          = identity_token.aws.jwt
    role_arn                = varset.role_dev.role_arn

    source_bucket_name      = "manu-2024-source"
    destination_bucket_name = "manu-2024-destination"
    prefix                  = "dev"

    replication_role        = "stacks-replication"
    replication_policy      = "stacks-replication"
  }
}
