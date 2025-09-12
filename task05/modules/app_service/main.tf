resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags
  site_config {
    dynamic "ip_restriction" {
      for_each = var.ip_restriction
      content {
        ip_address                = ip_restriction.value.ip_address
        action                    = lookup(ip_restriction.value, "action", null)
        priority                  = lookup(ip_restriction.value, "priority", null)
        name                      = lookup(ip_restriction.value, "name", null)
        virtual_network_subnet_id = lookup(ip_restriction.value, "virtual_network_subnet_id", null)
        service_tag               = lookup(ip_restriction.value, "service_tag", null)
      }
    }
    # default to deny all
    ip_restriction {
      ip_address  = "0.0.0.0/0"
      action      = "Deny"
      priority    = 65000
      name        = "DenyAll"
      description = "Deny all traffic by default"
    }
  }
}
