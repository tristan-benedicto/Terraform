output "vnet_id" {
  description = "The ID of the created Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "The ID of the created Subnet"
  value       = azurerm_subnet.main.id
}

output "public_ip_address" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_public_ip.main.ip_address
}

output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.main.name
}

output "vm_id" {
  description = "The ID of the created Virtual Machine"
  value       = azurerm_virtual_machine.main.id
}

output "vm_name" {
  description = "The name of the created Virtual Machine"
  value       = azurerm_virtual_machine.main.name
}

output "nsg_id" {
  description = "The ID of the created Network Security Group"
  value       = azurerm_network_security_group.main.id
}

output "access_instruction" {
  description = "Instructions for accessing the VM"
  value       = "SSH to the VM using: ssh azureuser@${azurerm_public_ip.main.ip_address}"
}

output "http_endpoint" {
  description = "HTTP endpoint for the Nginx server"
  value       = "http://${azurerm_public_ip.main.ip_address}"
}
