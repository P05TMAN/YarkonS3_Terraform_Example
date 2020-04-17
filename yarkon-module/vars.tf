# Yarkon Server Variables

# These variables must be passed to the module
variable "stack_name" {}
variable "environment" {}
variable "purpose" {}
variable "client" {}
variable "project" {}
variable "aws_region" {}
variable "vpc_ids" {}
variable "priv_zone_id" {}
variable "pub_zone_id" {}
variable "target_id" {}
variable "app_elb" {}

# The following can be overridden

variable "subnet_id"{
  default = "subnet-blah"
}

variable "app_elb_sg" {
  default = "sg-blee"
}

variable "log_vol_size" {
  default = "30"
}

variable "instance_size" {
  default = "t3.medium"
}
