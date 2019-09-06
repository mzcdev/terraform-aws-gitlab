# data

data "aws_ami" "this" {
  most_recent = true

  owners = ["782774275127"] # GitLab's account ID.

  filter {
    name   = "name"
    values = ["GitLab CE-${var.gitlab_version}.*"]
  }
}
