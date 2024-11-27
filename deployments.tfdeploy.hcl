identity_token "aws" {
  audience = ["aws.workload.identity"]
}

store "varset" "roles" {
  id       = "varset-6pcUK8q4FQVLBRJY"
  category = "env"
}

deployment "dev" {
  inputs = {
    identity_token          = identity_token.aws.jwt
    role_arn                = store.varset.roles.role_dev

    source_bucket_name      = "manu-2024-source"
    destination_bucket_name = "manu-2024-dest"
    suffix                  = "dev"

    replication_role        = "stacks-replication"
    replication_policy      = "stacks-replication"
  }
}

deployment "prod" {
  inputs = {
    identity_token          = identity_token.aws.jwt
    role_arn                = store.varset.roles.role_prod

    source_bucket_name      = "manu-2024-source"
    destination_bucket_name = "manu-2024-dest"
    suffix                  = "prod"

    replication_role        = "stacks-replication"
    replication_policy      = "stacks-replication"
  }
}