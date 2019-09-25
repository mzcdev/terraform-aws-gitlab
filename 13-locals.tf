# locals

locals {
  domain_name = var.dns_name != "" ? var.dns_name : "git.${var.dns_root}"

  dns_name = var.dns_root != "" ? local.domain_name : aws_elb.this.dns_name
}
