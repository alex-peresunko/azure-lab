output "rg_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.task03_rg.id
}

output "sa_blob_endpoint" {
  description = "Storage account blob service primary endpoint"
  value       = azurerm_storage_account.task03_storage_account.primary_blob_endpoint
}

output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.task03_vnet.id
}