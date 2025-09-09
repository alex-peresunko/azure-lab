resource "azurerm_service_plan" "this" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.asp_sku_name
  os_type             = var.asp_os_type
  worker_count        = var.asp_worker_count
  tags                = var.asp_tags
}


resource "azurerm_linux_web_app" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.this.id
  tags                = var.app_tags
  identity {
    type = "SystemAssigned"
  }
  connection_string {
    name  = "MyDbConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
  site_config {
    application_stack {
      dotnet_version = var.app_dotnet_version
    }
    dynamic "ip_restriction" {
      for_each = var.app_ip_restriction
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

resource "azurerm_role_assignment" "webapp_kv_secrets" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_linux_web_app.this.identity[0].principal_id
}