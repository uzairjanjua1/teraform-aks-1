variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-aks-tr"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL Server"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL Server"
  type        = string
  default     = "Pakistan123!"
}
