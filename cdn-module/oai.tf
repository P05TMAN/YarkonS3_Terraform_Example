## CDN OAI
resource "aws_cloudfront_origin_access_identity" "cdn_oai" {
  comment = "OAI for CDN"
}
