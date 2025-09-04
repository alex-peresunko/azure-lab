resource "azurerm_resource_group" "task03_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tag_creator
}


resource "azurerm_storage_account" "task03_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.task03_rg.name
  location                 = azurerm_resource_group.task03_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  tags                     = merge(var.storage_account_tags, var.tag_creator)
}


resource "azurerm_virtual_network" "task03_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.task03_rg.location
  resource_group_name = azurerm_resource_group.task03_rg.name
  address_space       = var.vnet_address_space
  tags                = var.tag_creator
}


resource "azurerm_subnet" "task03_subnet_frontend" {
  name                 = var.subnet_frontend_name
  resource_group_name  = azurerm_resource_group.task03_rg.name
  virtual_network_name = azurerm_virtual_network.task03_vnet.name
  address_prefixes     = var.subnet_frontend_address_prefixes
}

resource "azurerm_subnet" "task03_subnet_backend" {
  name                 = var.subnet_backend_name
  resource_group_name  = azurerm_resource_group.task03_rg.name
  virtual_network_name = azurerm_virtual_network.task03_vnet.name
  address_prefixes     = var.subnet_backend_address_prefixes
}
