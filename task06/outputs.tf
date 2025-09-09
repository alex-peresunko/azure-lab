output "sql_server_fqdn" {
  value = module.sql.fully_qualified_domain_name
}

output "app_hostname" {
  value = module.webapp.app_hostname
}