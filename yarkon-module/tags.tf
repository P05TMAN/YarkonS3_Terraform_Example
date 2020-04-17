# Yarkon Server Tags

locals {
  common_tags = {
    managed_by_terraform = "true"
    Name                 = "${var.stack_name}"
    Project              = "${var.project}"
    Environment          = "${var.environment}"
    Purpose              = "${var.purpose}"
    Client               = "${var.client}"
  }
}
