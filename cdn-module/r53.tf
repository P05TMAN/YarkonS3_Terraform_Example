# Route 53 record for Yarkon CDN

resource "aws_route53_record" "cdn_public" {
  zone_id = var.pub_zone_id
  name    = "cdn.mycompany.com"
  type    = "A"

  alias {
    name = var.cdn_domain
    zone_id = var.cdn_zoneid
    evaluate_target_health = false
  }
}
