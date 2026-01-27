module "rg" {
  source   = "./modules/rg"
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.rg.name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.rg.name
  location            = var.location
  acr_name            = var.acr_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.rg.name
  location            = var.location
  aks_name            = var.aks_name
  subnet_id           = module.vnet.subnet_id
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = module.aks.kubelet_object_id
  role_definition_name = "AcrPull"
  scope                = module.acr.acr_id
}