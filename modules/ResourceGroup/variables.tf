variable "rg_name" {
  description = "Name of the Resource Group"
  default     = ""
}

variable "rg_location" {
  description = "Location of the Resource Group"
  default     = ""
}

variable "rg_tag" {
  description = "The tags to associate the resource we are creating"
  type        = map(string)
  default     = {}
}

