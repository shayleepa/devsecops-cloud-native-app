variable "resource_group_name" {
  type        = string
  default     = "rg-devsecops-cloud-native"
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region for all resources"
}

variable "acr_name" {
  type        = string
  default     = "acrdevsecopsapp2026"
  description = "Globally unique name for Azure Container Registry"
}