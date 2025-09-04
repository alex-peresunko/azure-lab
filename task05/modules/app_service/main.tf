resource "azurerm_windows_web_app" "web_app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    always_on     = true
    ftps_state    = "Disabled"
    http2_enabled = true

    dynamic "ip_restriction" {
      for_each = var.app_allow_ip_rule
      content {
        ip_address = ip_restriction.value.ip_address
        name       = ip_restriction.value.name
        priority   = ip_restriction.value.priority
        action     = "Allow"
      }
    }

    dynamic "ip_restriction" {
      for_each = var.app_allow_tag_rule
      content {
        service_tag = ip_restriction.value.service_tag
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = "Allow"
      }
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}