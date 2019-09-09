# locals

locals {
  default_domain = var.base_domain != "" ? "git.${var.base_domain}" : ""

  domain = var.domain != "" ? var.domain : local.default_domain
}
