variable "aks_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "subnet_id" {}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "3tier"

  default_node_pool {
    name           = "system"
    node_count     = 2
    vm_size = "Standard_DC2s_v3"
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }
}
