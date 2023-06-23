
# Create resource group
resource "azurerm_resource_group" "mk-mssql" {
  name     = "mk-db-rg"
  location = var.location
}

# Create security group
resource "azurerm_network_security_group" "nsg_group" {
  name                = "test-mk-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.mk-mssql.name
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "test-mk-vnet"
  resource_group_name = azurerm_resource_group.mk-mssql.name
  address_space       = ["10.0.0.0/24"]
  location            = var.location
}

# Create a subnet
resource "azurerm_subnet" "subnet-mk" {
  name                 = "test-mk-subnet"
  resource_group_name  = azurerm_resource_group.mk-mssql.name
  virtual_network_name = azurerm_virtual_network.vnet.id
  address_prefixes     = ["10.0.0.0/27"]

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
    name = "Microsoft.Sql/managedInstances"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

# Associate subnet and the security group
resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  subnet_id                 = azurerm_subnet.subnet-mk.id
  network_security_group_id = azurerm_network_security_group.nsg_group.id
}

# Create a route table
resource "azurerm_route_table" "rt_table" {
  name                          = "test-mk-rt"
  location                      = var.location
  resource_group_name           = azurerm_resource_group.mk-mssql.name
  disable_bgp_route_propagation = false
}

# Associate subnet and the route table
resource "azurerm_subnet_route_table_association" "subnet_route_table" {
  subnet_id      = azurerm_subnet.subnet-mk.id
  route_table_id = azurerm_route_table.rt_table.id
}

resource "azurerm_mssql_managed_instance" "main" {
  name                         = "test-mk-mssql"
  resource_group_name          = azurerm_resource_group.mk-mssql.name
  location                     = var.location
  subnet_id                    = azurerm_subnet.subnet-mk.id
  administrator_login          = "${replace(random_pet.prefix.id, "-", "")}admin"
  administrator_login_password = random_password.password.result
  license_type                 = var.license_type
  sku_name                     = var.sku_name
  vcores                       = var.vcores
  storage_size_in_gb           = var.storage_size_in_gb
}

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}
