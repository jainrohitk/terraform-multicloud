output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}

output "subnet_ids" {
  description = "Subnet IDs keyed by stable subnet names."
  value       = { for name, subnet in azurerm_subnet.lab : name => subnet.id }
}

output "nic_ids" {
  description = "Empty tuple when disabled, one NIC ID when enabled."
  value       = azurerm_network_interface.lab[*].id
}

output "nic_private_ips" {
  description = "Private addresses only; no public IP is created."
  value       = azurerm_network_interface.lab[*].private_ip_address
}
