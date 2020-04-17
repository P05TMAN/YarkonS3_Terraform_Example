# yarkonserver Server EC2 Configuration

resource "aws_instance" "yarkonserver" {

  ami                     = data.aws_ami.yarkonserver.id
  instance_type           = var.instance_size
  ebs_optimized           = true
  vpc_security_group_ids  = [aws_security_group.yarkonserver_sg.id]
  iam_instance_profile    = data.terraform_remote_state.yarkon_profile.outputs.yarkon_role_name
  subnet_id               = data.aws_subnet.selected.id

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.log_vol_size
    delete_on_termination = true
    encrypted = true
  }

  tags = local.common_tags

}
