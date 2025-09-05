resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  dns_config {
    relative_name = var.dns_config_relative_name
    ttl           = var.dns_config_ttl
  }

  monitor_config {
    protocol = var.monitor_config.protocol
    port     = var.monitor_config.port
    path     = var.monitor_config.path
  }

  tags = var.tags

}

resource "azurerm_traffic_manager_azure_endpoint" "this" {
  for_each           = var.endpoints
  name               = each.value.name
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = each.value.target_resource_id
  weight             = each.value.weight
  priority           = each.value.priority
}