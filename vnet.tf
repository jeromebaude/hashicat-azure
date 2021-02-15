module "vnet" {
  source  = "app.terraform.io/jerome-playground/vnet/azurerm"
  version = "2.0.0"
  # insert required variables here
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}
