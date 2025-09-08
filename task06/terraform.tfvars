common_tags = {
  Creator = "oleksandr_peresunko@epam.com"
}

resource_group_name = "task06-rg"
location            = "West Europe"

key_vault_name                 = "task06-kv"
key_vault_resource_group_name  = "task06-rg"
key_vault_secret_name_username = "sql-admin-username"
key_vault_secret_name_password = "sql-admin-password"

sql_server_name        = "task06-sqlserver"
sql_server_version     = "12.0"
sql_allowed_ip_address = "95.67.77.76"

# -- App Service variables
asp_name         = "task06-asp"
asp_os_type      = "Windows"
asp_sku_name     = "B1"
asp_worker_count = 1
app_name         = "task06-webapp"
asp_location     = "westeurope"
app_ip_restriction = [
  {
    ip_address = "95.67.77.76"
    action     = "Allow"
    priority   = 100
    name       = "AllowDevIP"
  }
]