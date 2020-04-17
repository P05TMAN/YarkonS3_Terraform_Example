# Providers for Yarkon Server prod
provider "aws" {
  version = "~> 2.57.0"
  region  = "us-east-1"
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
