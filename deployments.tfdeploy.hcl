identity_token "aws" {
  audience = [ "aws.workload.identity" ]
}

deployment "dev" {
inputs = {
    identity_token = identity_token.aws.jwt
    role_arn = "arn:aws:iam::697621333100:role/stack_role"
    source_bucket_name = "manu-2024-source"
    destination_bucket_name = "manu-2024-destination"
    replication_policy = "stacks-replication"
    replication_role = "stacks-replication"
    prefix="dev"
}
}