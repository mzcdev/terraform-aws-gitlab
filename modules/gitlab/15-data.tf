# data

data "aws_ami" "this" {
  most_recent = true

  owners = ["782774275127"] # GitLab's account ID.

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["GitLab CE ${var.gitlab_version}.*"]
  }
}

data "template_file" "setup" {
  template = file("${path.module}/template/setup.sh")

  vars = {
    DNS_NAME = local.domain
    WORK_DIR = "/mnt/data"
  }
}
