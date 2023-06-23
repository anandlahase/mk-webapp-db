variable "rg_name" {
  description = "Name of the Resource Group"
  default     = ""
}

variable "appservice_name" {
  description = "Name of the App service Plan"
  default     = ""
}

#variable "appservice_name_app" {
 # description = "Name of the App service Plan"
 # default     = ""
#}

variable "location" {
  type        = string
  description = "Enter the location where you want to deploy the resources"
  default     = "westeurope"
}