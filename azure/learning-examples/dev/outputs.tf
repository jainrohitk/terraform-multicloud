output "resource_group_name" {
  value = module.lab.resource_group_name
}

output "subnet_ids" {
  value = module.lab.subnet_ids
}

output "nic_ids" {
  value = module.lab.nic_ids
}

output "nic_private_ips" {
  value = module.lab.nic_private_ips
}
