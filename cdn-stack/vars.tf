# Variables for the Production CDN stack
variable "stack_name" {
  default = "nva-a-cso-cdn"
}

variable "environment" {
  default = "Admin"
}

variable "purpose" {
  default = "Production CDN"
}

variable "project" {
  default = "Production CDN"
}

variable "client" {
  default = "client-if-applicable"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "role" {
 default = "arn:aws:iam::<acctNumber:role/<roleName>"
}

variable "acm_certificate_arn" {
 default = "arn:aws:acm:us-east-1:<acctNumber>:certificate/<certId>"
}
