//--------------------------------------------------------------------
// Modules
module "network" {
  source  = "app.terraform.io/jerome-playground/network/azurerm"
  version = "3.0.1"

  resource_group_name = "jerome-workshop"
}