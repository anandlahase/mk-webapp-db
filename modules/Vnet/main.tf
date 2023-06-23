resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.rg_name
  location            = var.vnet_location
  name                = var.vnet_name
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags
}