variable "rg_name" {
  description = "The name of the resource group we want to use"
  default     = ""
}

variable "vnet_location" {
  description = "The location/region where we are crrating the resource"
  type        = string
  default     = ""
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = ""
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = ""
}

variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "tags" {
  description = ""
  type        = map(string)
  default     = {}
}
