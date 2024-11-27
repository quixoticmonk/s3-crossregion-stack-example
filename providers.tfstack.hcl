required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "5.72.1"
  }
}

provider "aws" "source" {
  config {
    region = "us-east-1"
    
    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }
  }
}

provider "aws" "dest" {
  config {
    region = "us-west-2"
    
    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }
  }
}