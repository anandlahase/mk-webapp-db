variable "nic_name" {
  description = "The name of the NIC"
  default     = ""
}

variable "nic_location" {
  description = "The location of the NIC"
  default     = ""
}

variable "rg_name" {
  description = "The name of the resource group we want to use"
  default     = ""
}

# IP configuration for NIC

variable "ipConfig_name" {
  description = "The name of the IP configuration used in NIC creation"
  default     = ""
}

variable "ipConfig_subnetid" {
  description = "The subnet id of the IP configuration used in NIC creation"
  default     = ""
}

variable "ipConfig_privateIpAllocation" {
  description = "The Private IP Allocation of the IP configuration used in NIC creation"
  default     = ""
}

variable "ipConfig_pipId" {
  description = "The Public IP of the IP configuration used in NIC creation"
  default     = ""
}