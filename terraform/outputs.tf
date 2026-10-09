output "resource_group_name" {
  value = azurerm_resource_group.devsecops_rg.name
  description = "The name of the Azure Resource Group"
}

output "acr_login_server" {
  value       = azurerm_container_registry.devsecops_acr.login_server
  description = "Login server endpoint for Azure Container Registry"
}