output "sql_server_fqdn" {
  value       = module.sql.fully_qualified_domain_name
  description = "The fully qualified domain name of the SQL server."
}

output "app_hostname" {
  value       = module.webapp.app_hostname
  description = "The hostname of the web application."
}