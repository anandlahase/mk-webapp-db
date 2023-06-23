resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = var.sr_name
    priority                   = var.sr_priority
    direction                  = var.sr_direction
    access                     = var.sr_access
    protocol                   = var.sr_protocol
    source_port_range          = "*"
    destination_port_range     = var.sr_destination_port_range
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}