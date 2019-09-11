# locals

locals {
  default_domain = var.base_domain != "" ? "git.${var.base_domain}" : ""

  domain = var.domain != "" ? var.domain : local.default_domain
}

locals {
  dns_name = var.base_domain != "" ? local.domain : aws_elb.this.dns_name
}
