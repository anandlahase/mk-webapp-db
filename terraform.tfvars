# For Resource Group Module
rg_name = "MK_RG"

# Commonly used for all modules
location = "westeurope"
default_tags = {
  environment = "poc"
  deployed_by = "terraform"
}

# For Vnet
vnet_name     = "MK_vnet"
address_space = "10.0.0.0/16"

# For Subnet Module
subnet_name = "MKpocSubnet"
subnet      = "10.0.10.0/24"

# For Public IP creation
pip_name          = "mkpip"
allocation_method = "Dynamic"

# For NSG
nsg_name = "mk_nsg"

# Security rule variable used in NSG
sr_name                   = "rdp"
sr_priority               = "2000"
sr_direction              = "Inbound"
sr_access                 = "Allow"
sr_protocol               = "Tcp"
sr_destination_port_range = "3389"

# For NIC
nic_name                     = "mk_nic"
ipConfig_name                = "internal"
ipConfig_privateIpAllocation = "Dynamic"

# For Webapp
appservice_name = "test-aap-ananad-laha"
#appservice_name_app = "mkapp"


# For Mssql
storage_size_in_gb = "32"
vcores             = "8"
license_type       = "BasePrice"
sku_name           = "GP_Gen5"
#resource_group_name = "wwhwhfwhfhsfhs"
mssql_location = "westeurope"

