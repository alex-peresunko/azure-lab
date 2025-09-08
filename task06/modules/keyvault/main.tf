resource "azurerm_key_vault" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tenant_id           = var.tenant_id


  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id           = each.value.tenant_id
      object_id           = each.value.object_id
      key_permissions     = each.value.key_permissions
      secret_permissions  = each.value.secret_permissions
      certificate_permissions = try(each.value.certificate_permissions, null)
      storage_permissions     = try(each.value.storage_permissions, null)
    }
  }

  tags = var.tags
}
