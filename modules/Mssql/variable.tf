

variable "mssql_location" {
  description = "The location of the NIC"
  default     = ""
}

variable "subnet_name" {
  description = "The address prefix to use for the subnet."
  default     = "MKpocSubnet"
}

variable "prefix" {
  type        = string
  default     = "MK"
  description = "Prefix of the resource name"
}

variable "sku_name" {
  type        = string
  description = "Enter SKU"
}

variable "license_type" {
  type        = string
  description = "Enter license type"
}

variable "vcores" {
  type        = number
  description = "Enter number of vCores you want to deploy"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Enter storage size in GB"
}

#variable "rg_name" {
#  description = "Name of the Resource Group"
# default     = "MK_RG"
#}

variable "ipConfig_subnetid" {
  description = "The subnet id of the IP configuration used in NIC creation"
  default     = ""
}

variable "subnet" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "location" {
  type        = string
  description = "Enter the location where you want to deploy the resources"
  default     = "westeurope"
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}
