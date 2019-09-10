# output

output "name" {
  value = var.name
}

output "key_name" {
  value = aws_instance.this.key_name
}

output "dns_name" {
  value = aws_route53_record.this.*.name
}
