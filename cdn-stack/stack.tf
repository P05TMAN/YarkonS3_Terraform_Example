# Main stack for Prod CSO CDN

module "cdn_module" {
  source              = "../cdn-module"
  environment         = var.environment
  purpose             = var.purpose
  project             = var.project
  stack_name          = var.stack_name
  client              = var.client
  acm_certificate_arn = var.acm_certificate_arn
  cdn_domain          = module.cdn_module.cdn_domain_name
}
