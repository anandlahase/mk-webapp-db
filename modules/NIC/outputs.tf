output "nic_id" {
  description = "The ID of the newly created NIC"
  value       = azurerm_network_interface.NIC.id
}