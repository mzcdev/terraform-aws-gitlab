# route53

data "aws_route53_zone" "this" {
  count = var.base_domain != "" ? 1 : 0
  name  = var.base_domain
}

resource "aws_route53_record" "this" {
  count   = var.base_domain != "" ? 1 : 0
  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = local.domain
  type    = "A"
  ttl     = 300

  records = [
    aws_eip.this.public_ip,
  ]
}
