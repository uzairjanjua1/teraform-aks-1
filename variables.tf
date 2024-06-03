variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-aks-tr"   # Default name of the resource group
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "eastus"         # Default Azure region
}
