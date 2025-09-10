resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"
}

import {
  to = azurerm_resource_group.rg
  id = var.resource_group_id
}
resource "azurerm_storage_account" "task07_sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enforced settings
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
}

import {
  to = azurerm_storage_account.task07_sa
  id = var.storage_account_id
}

