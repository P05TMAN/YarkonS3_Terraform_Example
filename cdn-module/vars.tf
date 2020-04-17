# These variables must be passed to the module
variable "stack_name" {}
variable "environment" {}
variable "purpose" {}
variable "client" {}
variable "project" {}
variable "acm_certificate_arn" {}
variable "cdn_domain" {}

#### NEVER override; this is set by AWS ####
variable "cdn_zoneid" {
  default = "Z2FDTNDATAQYW2"
}
############################################

variable "priv_zone_id" {
  default = "<zoneID>"
}

variable "pub_zone_id" {
  default = "<zoneID>"
}

variable "log_prefix" {
  default = "CDN Logs"
}

variable "my_bucketname" {}
