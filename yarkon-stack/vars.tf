# Variables for prod Yarkon Server

variable "priv_zone_id" {
  default = "<zoneID>"
}

variable "pub_zone_id" {
  default = "<zoneID>"
}

variable "app_elb" {
  default = "elb-name.us-east-1.elb.amazonaws.com"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "stack_name" {
  default = "name-of-stack"
}

variable "environment" {
  default = "Environment"
}

variable "purpose" {
  default = "Yarkon Server"
}

variable "project" {
  default = "Yarkon Server"
}

variable "client" {
  default = "client-if-applicable"
}

variable "vpc_id" {
  default = "vpc-blah"
}
