variable "nsg_name" {
  description = "Name of the Resource Group"
  default     = ""
}

variable "rg_name" {
  description = "Name of the Resource Group"
  default     = ""
}

variable "nsg_location" {
  description = "Location of the Network Security Group"
  default     = ""
}

# For Security rule 

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