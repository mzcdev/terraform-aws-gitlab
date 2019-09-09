# output

output "name" {
  value = var.name
}

output "key_name" {
  value = aws_instance.this.key_name
}

output "public_ip" {
  value = aws_eip.this.public_ip
}

output "dns_name" {
  value = aws_route53_record.this.*.name
}
