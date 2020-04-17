# Production Yarkon Server Stack

module "yarkon-server" {
  source       = "../yarkon-module"
  aws_region   = var.aws_region
  environment  = var.environment
  purpose      = var.purpose
  project      = var.project
  stack_name   = var.stack_name
  vpc_ids      = var.vpc_id
  client       = var.client
  app_elb      = var.app_elb
  priv_zone_id = var.priv_zone_id
  pub_zone_id  = var.pub_zone_id
  target_id    = module.yarkon-server.yarkon_instance_id
}
