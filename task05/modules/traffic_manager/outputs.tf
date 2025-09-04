
output "traffic_manager_profile_id" {
  description = "The ID of the Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.id
}

output "traffic_manager_profile_name" {
  description = "The name of the Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.name
}

output "traffic_manager_profile_dns_name" {
  description = "The DNS name of the Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.this.fqdn
}
