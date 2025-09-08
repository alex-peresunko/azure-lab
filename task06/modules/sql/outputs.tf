output "name" {
  value = azurerm_mssql_server.this.name
}

output "fully_qualified_domain_name" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}

output "sql_connection_string" {
  value     = "Server=tcp:${azurerm_mssql_server.this.name}.database.windows.net,1433;Initial Catalog=master;Persist Security Info=False;User ID=${local.sql_admin_username};Password=${local.sql_admin_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive = true
}