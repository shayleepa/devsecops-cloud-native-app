variable "resource_group_name" {
    type    = string
    default = "rg=devsecops-capstone"
    description = "Name of the Azure Resource Group"
}

variable "location" {
    type    = string
    default = "eastus"
    description = "Azure region for all resources"
}

variable "acr_name" {
    type    = string
    default = "acrdevsecopscatstone123" # Must be globally unique. alphanumeric only
    description = "Name of the Azure container registry"
}

variable "aks_cluster_name" {
    type    = string
    default ="aks-devsecops-cluster"
    description = "Name of the AKS Cluster"
}