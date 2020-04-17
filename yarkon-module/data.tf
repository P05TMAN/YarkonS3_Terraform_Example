# Yarkon Server EC2 Terraform Data

# AMI
data "aws_ami" "yarkonserver" {
  most_recent = "true"
  owners      = ["679593333241"] # Yarkon

  filter {
    name   = "name"
    values = ["yarkon-server-amp20-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# For use with single EC2
data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}

# Role Terraform_backend State
data "terraform_remote_state" "yarkon_profile" {
  backend = "s3"

  config = {
    bucket = "<bucketName>"
    region = "us-east-1"
    key    = "path/to/state.tfstate"
  }
}

# Yarkon Prod VPC

data "aws_vpc" "selected" {
  id = "${var.vpc_ids}"
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.selected.id}"


  filter {
    name   = "tag:Example1"
    values = ["Example1"]
  }

  filter {
    name   = "tag:Example2"
    values = ["Example2"]
  }

  filter {
    name   = "tag:Example3"
    values = ["Example3"]
  }
}
