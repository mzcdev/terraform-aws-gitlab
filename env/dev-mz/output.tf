# output

output "name" {
  value = module.gitlab.name
}

output "key_name" {
  value = module.gitlab.key_name
}

output "public_ip" {
  value = module.gitlab.public_ip
}

output "dns_name" {
  value = module.gitlab.dns_name
}
