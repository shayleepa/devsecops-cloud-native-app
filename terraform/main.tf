# 1. Azure Resource Group
resource "azurerm_resource_group" "rg" {
    name    = var.resource_group
    location    = var.location

    tags    =   {
        Environment = "Development"
        ManagedBy   = "Terraform"
        Project = "DevSecOps-Capstone"
    }
}

# 2. Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
    name    = var.acr_name
    resource_group_name = azurerm_resource_group.rg.name
    location    = azurerm_resource_group.rg.location
    sku = "Standard"
    admin_enabled   = true

    tags = {
        Environment = "Development"
        ManagedBy   = "Terraform"
    }
}

# 3. Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
    name    = "systempool"
    node_count  = 2
    vm_size = "Standard_B2s" #Low-cost VM size ideal for lab/dev testing
}

    identity {
        type = "SystemAssigned"
    }
    
    tags = {
        Environment = "Development"
        ManagedBy = "Terraform"
    }

    # 4. Attach ACR to AKS so Kubernetes can pull images without manual secrets resource "azurerm_role_assignment" "aks_sct_pull" {
        principal_id azurerm\_kubernetes\_cluster.aks.kubelet\_identity[0].object\_id
        role_definition_name    = "AcrPull"
        scope   = azurerm_container_registry.acr.id
        skip_service_principal_aad_check    = true
    }