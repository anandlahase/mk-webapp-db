output "nsg_id" {
  description = "The ID of the newly created NSG"
  value       = azurerm_network_security_group.nsg.id
}