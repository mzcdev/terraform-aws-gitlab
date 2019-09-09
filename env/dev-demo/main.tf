# bastion

terraform {
  backend "s3" {
    region = "ap-northeast-2"
    bucket = "terraform-nalbam-seoul"
    key    = "gitlab.tfstate"
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "gitlab" {
  source = "../../modules/gitlab"

  name = local.full_name

  vpc_id = var.vpc_id

  subnet_id = var.subnet_id

  gitlab_version = var.gitlab_version

  allow_ip_address = var.allow_ip_address

  key_name = var.key_name

  base_domain = var.base_domain
}
