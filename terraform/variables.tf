variable "location" {
  description = "Azure region"
  default     = "East US"
} 

variable "resource_group_name" {
  description = "Resource group name"
  default     = "3tierapp-rg"
}

variable "acr_name" {
  description = "ACR name (must be globally unique)"
  default     = "tierappacr123"
}

variable "aks_name" {
  description = "AKS cluster name"
  default     = "3tierapp-aks"
}
