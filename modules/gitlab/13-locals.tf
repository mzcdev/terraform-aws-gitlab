# locals

locals {
  domain = var.domain != "" ? var.domain : "git.${var.base_domain}"
}
