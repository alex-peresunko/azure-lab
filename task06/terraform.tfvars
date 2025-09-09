common_tags = {
  Creator = "oleksandr_peresunko@epam.com"
}

location = "centralindia"

key_vault_name                 = "cmaz-nw9g0zfg-mod6-kv"
key_vault_resource_group_name  = "cmaz-nw9g0zfg-mod6-kv-rg"
key_vault_secret_name_username = "sql-admin-name"
key_vault_secret_name_password = "sql-admin-password"


sql_server_version = "12.0"
allowed_ip_address = "18.153.146.156"

sql_database_collation   = "SQL_Latin1_General_CP1_CI_AS"
sql_database_sku_name    = "S2"
sql_database_max_size_gb = 2

# -- App Service variables
asp_os_type        = "Linux"
asp_sku_name       = "P0v3"
asp_worker_count   = 1
app_dotnet_version = "8.0"
asp_location       = "centralindia"
app_ip_restriction = [
  {
    ip_address = "18.153.146.156/32"
    action     = "Allow"
    priority   = 100
    name       = "allow-verification-ip"
  }
]