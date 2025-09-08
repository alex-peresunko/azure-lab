data "azurerm_client_config" "current" {}

resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>:?"
}

resource "random_string" "sql_admin_username_suffix" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

locals {
  sql_admin_username = "sqladmin-${random_string.sql_admin_username_suffix.result}"
  sql_admin_password = random_password.this.result
}

# --- Look up the existing Key Vault using the new variables ---
data "azurerm_key_vault" "existing_kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

resource "azurerm_key_vault_secret" "vault_sql_admin_username" {
  name         = var.key_vault_secret_name_username
  value        = local.sql_admin_username
  key_vault_id = data.azurerm_key_vault.existing_kv.id
}
resource "azurerm_key_vault_secret" "vault_sql_admin_password" {
  name         = var.key_vault_secret_name_password
  value        = local.sql_admin_password
  key_vault_id = data.azurerm_key_vault.existing_kv.id
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "${var.sql_server_name}-identity"
  resource_group_name = var.resource_group_name
  location            = var.location

}

resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = local.sql_admin_username
  administrator_login_password = local.sql_admin_password
  tags                         = var.tags

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.this.name
    object_id      = azurerm_user_assigned_identity.this.principal_id
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }

  primary_user_assigned_identity_id = azurerm_user_assigned_identity.this.id

  depends_on = [data.azurerm_client_config.current, local.sql_admin_username, local.sql_admin_password]
}