
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
  sql_allowed_ip_address         = var.sql_allowed_ip_address
  depends_on                     = [module.resource_group]
}

module "webapp" {
  source              = "./modules/webapp"
  resource_group_name = var.resource_group_name
  asp_name            = var.asp_name
  location            = var.asp_location
  asp_os_type         = var.asp_os_type
  asp_sku_name        = var.asp_sku_name
  asp_worker_count    = var.asp_worker_count
  asp_tags            = var.common_tags
  app_name            = var.app_name
  app_tags            = var.common_tags
  app_ip_restriction  = var.app_ip_restriction
  depends_on          = [module.resource_group]

}