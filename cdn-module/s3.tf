resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_bucketname
  acl    = "private"
  policy = data.aws_iam_policy_document.s3_policy_my_bucket.json

  tags = local.common_tags

  cors_rule {
    allowed_origins = ["https://yarkons3.mycompany.com"]
    allowed_methods = ["HEAD", "GET", "PUT", "POST", "DELETE"]
    expose_headers  = ["ETag", "x-amz-server-side-encryption"]
    allowed_headers = ["*"]
  }
}
