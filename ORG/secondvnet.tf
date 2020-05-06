//--------------------------------------------------------------------
// Modules
module "vnet" {
  source  = "app.terraform.io/jerome-playground/vnet/azurerm"
  version = "2.0.0"

  resource_group_name = "${var.prefix}-workshop"
}