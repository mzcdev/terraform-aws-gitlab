# output

output "name" {
  value = module.gitlab.name
}

output "private_ip" {
  value = module.gitlab.private_ip
}

output "dns_name" {
  value = module.gitlab.dns_name
}
