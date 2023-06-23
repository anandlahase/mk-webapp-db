resource "azurerm_network_interface_security_group_association" "nic_association" {
  network_interface_id      = var.nic_id
  network_security_group_id = var.nsg_id
}