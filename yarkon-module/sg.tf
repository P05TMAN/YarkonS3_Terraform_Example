# Security Group Configuration for Yarkon Server

resource "aws_security_group" "yarkonserver_sg" {
  name_prefix = var.stack_name
  description = "Yarkon Server security group for ${var.stack_name}"
  vpc_id      = data.aws_vpc.selected.id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.common_tags,
    map(
      "Name", "${var.stack_name}-sg"
    )
  )
}

resource "aws_security_group_rule" "default_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.yarkonserver_sg.id
}

resource "aws_security_group_rule" "yarkonserver_ssh" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["10.16.0.0/12"]
  security_group_id = aws_security_group.yarkonserver_sg.id
}

resource "aws_security_group_rule" "yarkonserver_client_ports" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  cidr_blocks              = ["10.16.0.234/32"]
  security_group_id        = aws_security_group.yarkonserver_sg.id
}

resource "aws_security_group_rule" "yarkonserver_alb_ports" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  source_security_group_id = var.app_elb_sg
  security_group_id        = aws_security_group.yarkonserver_sg.id
}

resource "aws_security_group_rule" "yarkonserver_icmp" {
  type              = "ingress"
  protocol          = "icmp"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["10.16.0.0/12"]
  security_group_id = aws_security_group.yarkonserver_sg.id
}
