
resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_routing_method
  dns_config {
    relative_name = var.relative_name
    ttl           = var.ttl
  }
  monitor_config {
    protocol                     = var.monitor_protocol
    port                         = var.monitor_port
    path                         = var.monitor_path
    interval_in_seconds          = var.monitor_interval_in_seconds
    timeout_in_seconds           = var.monitor_timeout_in_seconds
    tolerated_number_of_failures = var.monitor_tolerated_number_of_failures
  }
  tags = var.tags
}
