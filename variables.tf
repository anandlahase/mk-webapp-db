variable "rg_name" {
  description = "Name of Resource Group name"
  default     = ""
}

variable "location" {
  description = "Name of Resource Group location"
  default     = ""
}

variable "default_tags" {
  description = ""
  type        = map(string)
  default     = {}
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = ""
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "subnet_name" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "pip_name" {
  description = ""
  default     = ""
}

variable "allocation_method" {
  description = ""
  default     = ""
}

# Variables used for NSG Module

variable "nsg_name" {
  description = "Name of the Resource Group"
  default     = ""
}


# For Security rule in NSG

variable "sr_name" {
  description = "Name of the security rule in NSG"
  default     = ""
}

variable "sr_priority" {
  description = "Priority of the security rule in NSG"
  default     = ""
}

variable "sr_direction" {
  description = "Direction of the security rule in NSG"
  default     = ""
}

variable "sr_access" {
  description = "Access of the security rule in NSG"
  default     = ""
}

variable "sr_protocol" {
  description = "Protocol of the security rule in NSG"
  default     = ""
}

variable "sr_destination_port_range" {
  description = "Destination port range of the security rule in NSG"
  default     = ""
}

# Variables used for NIC Module
variable "nic_name" {
  description = "The name of the NIC"
  default     = ""
}

# IP configuration for NIC

variable "ipConfig_name" {
  description = "The name of the IP configuration used in NIC creation"
  default     = ""
}

variable "ipConfig_privateIpAllocation" {
  description = "The Private IP Allocation of the IP configuration used in NIC creation"
  default     = ""
}

# App serivce

variable "appservice_name" {
  description = "Name of the App service Plan"
  default     = ""
}

variable "appservice_name_app" {
  description = "Name of the App service Plan"
  default     = ""
}

# MSSQL DB
variable "prefix" {
  type        = string
  default     = "mi"
  description = "Prefix of the resource name"
}

variable "sku_name" {
  type        = string
  description = "Enter SKU"
  default     = ""
}

variable "license_type" {
  type        = string
  description = "Enter license type"
  default     = ""
}

variable "vcores" {
  type        = number
  description = "Enter number of vCores you want to deploy"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Enter storage size in GB"
}

variable "mssql_location" {
  description = "The location of the NIC"
  default     = ""
}
