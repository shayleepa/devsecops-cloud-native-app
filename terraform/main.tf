# Resource Group for DevSecOps Infrastructure
resource "azurerm_resource_group" "devsecops_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Container Registry (ACR) for storing Docker images 
resource "azurerm_container_registry" "devsecops_acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.devsecops_rg.name
  location            = azurerm_resource_group.devsecops_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}