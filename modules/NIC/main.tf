resource "azurerm_network_interface" "NIC" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ipConfig_name
    subnet_id                     = var.ipConfig_subnetid
    private_ip_address_allocation = var.ipConfig_privateIpAllocation
    public_ip_address_id          = var.ipConfig_pipId
  }
}