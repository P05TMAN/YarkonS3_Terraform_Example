# Route 53 records for Yarkon

resource "aws_route53_record" "yarkon_private" {
  zone_id = var.priv_zone_id
  name    = "yarkons3.mycompany.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.app_elb}"]


  # EC2 must be created first, else the ID is inaccessible and prone to error
  depends_on = [aws_instance.yarkonserver]
}

resource "aws_route53_record" "yarkon_public" {
  zone_id = var.pub_zone_id
  name    = "yarkons3.mycompany.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.app_elb}"]


  # EC2 must be created first, else the ID is inaccessible and prone to error
  depends_on = [aws_instance.yarkonserver]
}

# Target Group & instance attachment for Yarkon
resource "aws_lb_target_group" "yarkon_tg" {
  name        = "nva-a-yarkon-server"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_ids
  target_type = "instance"

  stickiness {
    type    = "lb_cookie"
    enabled = "false"
  }

  # EC2 must be created first, else the ID is inaccessible and prone to error
  depends_on = [aws_instance.yarkonserver]
}

resource "aws_lb_target_group_attachment" "yarkon_instance" {
  target_group_arn = aws_lb_target_group.yarkon_tg.arn
  target_id = var.target_id
  port = "80"

  # EC2 must be created first, else the ID is inaccessible and prone to error
  depends_on = [aws_instance.yarkonserver]

}
