variable "rg_name" {
  description = "The name of the resource group we want to use"
  default     = ""
}


# Everything below is for the module

variable "vnet_name" {
  description = "Name of the vnet to create the subnets in"
  default     = ""
}

variable "subnet" {
  description = "The address prefix to use for the subnet."
  default     = ""
}

variable "subnet_name" {
  description = "The address prefix to use for the subnet."
  default     = ""
}