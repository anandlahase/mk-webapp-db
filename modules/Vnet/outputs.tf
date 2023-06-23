output "vnet_name" {
  description = "The Name of the newly created Vnet"
  value       = azurerm_virtual_network.vnet.name
}