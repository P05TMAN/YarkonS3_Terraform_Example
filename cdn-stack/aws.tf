# Main stack for CDN (Prod env).
provider "aws" {
  version = "~> 2.57.0"
  region  = "us-east-1"

  assume_role {
    role_arn = var.role
  }
}


# Remote State Management
terraform {
  required_version = "~> 0.12.18"
  backend "s3" {
    bucket = "<bucketName>"
    region = "us-east-1"
    key    = "path/to/state.tfstate"
  }
}
