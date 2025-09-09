
### Client Configuration

data "azurerm_client_config" "current" {}

### Resource Group

module "resource_group" {
  source   = "./modules/resource_group"
  name     = local.rg_name
  location = var.location
  tags     = var.common_tags
}


# -- Key Vault --
data "azurerm_key_vault" "task06_kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

module "sql" {
  source                         = "./modules/sql"
  sql_server_name                = local.sql_server_name
  resource_group_name            = local.rg_name
  location                       = var.location
  sql_server_version             = var.sql_server_version
  tags                           = var.common_tags
  key_vault_id                   = data.azurerm_key_vault.task06_kv.id
  key_vault_secret_name_username = var.key_vault_secret_name_username
  key_vault_secret_name_password = var.key_vault_secret_name_password
  sql_allowed_ip_address         = var.sql_allowed_ip_address
  sql_database_name              = local.sql_db_name
  sql_database_collation         = var.sql_database_collation
  sql_database_sku_name          = var.sql_database_sku_name
  sql_database_max_size_gb       = var.sql_database_max_size_gb
  depends_on                     = [module.resource_group]
}

module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = local.rg_name
  asp_name              = local.asp_name
  location              = var.asp_location
  asp_os_type           = var.asp_os_type
  app_dotnet_version    = var.app_dotnet_version
  asp_sku_name          = var.asp_sku_name
  asp_worker_count      = var.asp_worker_count
  asp_tags              = var.common_tags
  app_name              = local.app_name
  app_tags              = var.common_tags
  app_ip_restriction    = var.app_ip_restriction
  sql_connection_string = module.sql.sql_connection_string
  depends_on            = [module.resource_group]

}