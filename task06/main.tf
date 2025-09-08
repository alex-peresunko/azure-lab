
### Client Configuration

data "azurerm_client_config" "current" {}

### Resource Group

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.common_tags
}


module "sql" {
  source                         = "./modules/sql"
  sql_server_name                = var.sql_server_name
  resource_group_name            = var.resource_group_name
  location                       = var.location
  sql_server_version             = var.sql_server_version
  tags                           = var.common_tags
  key_vault_name                 = var.key_vault_name
  key_vault_resource_group_name  = var.key_vault_resource_group_name
  key_vault_secret_name_username = var.key_vault_secret_name_username
  key_vault_secret_name_password = var.key_vault_secret_name_password

  depends_on = [module.resource_group]

}