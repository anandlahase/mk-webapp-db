provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source      = "./modules/ResourceGroup"
  rg_name     = var.rg_name
  rg_location = var.location
  rg_tag      = var.default_tags
}

module "aks_vnet" {
  source        = "./modules/Vnet"
  rg_name       = module.ResourceGroup.rg_name
  vnet_location = var.location
  tags          = var.default_tags
  vnet_name     = "${module.ResourceGroup.rg_name}-vnet"
  address_space = var.address_space
}

module "subnet" {
  source      = "./modules/subnet"
  rg_name     = module.ResourceGroup.rg_name
  vnet_name   = module.aks_vnet.vnet_name
  subnet      = [var.subnet]
  subnet_name = var.subnet_name
}

module "PublicIP" {
  source            = "./modules/PublicIP"
  pip_name          = var.pip_name
  pip_location      = var.location
  rg_name           = module.ResourceGroup.rg_name
  allocation_method = var.allocation_method
}

module "NetworkSecurityGroup" {
  source                    = "./modules/NSG"
  nsg_name                  = var.nsg_name
  rg_name                   = module.ResourceGroup.rg_name
  nsg_location              = var.location
  sr_name                   = var.sr_name
  sr_priority               = var.sr_priority
  sr_direction              = var.sr_direction
  sr_access                 = var.sr_access
  sr_protocol               = var.sr_protocol
  sr_destination_port_range = var.sr_destination_port_range

}

module "NetworkInterface" {
  source                       = "./modules/NIC"
  nic_name                     = var.nic_name
  nic_location                 = var.location
  rg_name                      = module.ResourceGroup.rg_name
  ipConfig_name                = var.ipConfig_name
  ipConfig_subnetid            = module.subnet.subnet_id
  ipConfig_privateIpAllocation = var.ipConfig_privateIpAllocation
  ipConfig_pipId               = module.PublicIP.pip_id
}


module "NIC_NSG_Association" {
  source = "./modules/NSG_NIC_Association"
  nic_id = module.NetworkInterface.nic_id
  nsg_id = module.NetworkSecurityGroup.nsg_id
}

module "webapp" {
  source          = "./modules/Webapp"
  appservice_name = var.appservice_name
  rg_name         = module.ResourceGroup.rg_name
}

/*
module "mssql" {
  source = "./modules/mssql"
  #name                         = "${random_pet.prefix.id}-mk-mssql"
  #resource_group_name          = var.rg_name
  #location                     = var.mssql_location
  #subnet_id                    = var.subnet
  #administrator_login          = "${replace(random_pet.prefix.id, "-", "")}admin"
  #administrator_login_password = random_password.password.result
  license_type       = var.license_type
  sku_name           = var.sku_name
  vcores             = var.vcores
  storage_size_in_gb = var.storage_size_in_gb
}

*/

