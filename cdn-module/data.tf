data "aws_iam_policy_document" "s3_policy_cso_bucket" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.my_bucketname}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.cdn_oai.iam_arn}"]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.my_bucketname}"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.cdn_oai.iam_arn}"]
    }
  }
}
