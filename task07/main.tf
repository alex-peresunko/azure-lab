module "cdn" {
  source = "./modules/cdn"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  cdn_profile_name  = var.fd_profile_name
  cdn_endpoint_name = var.fd_endpoint_name

  origin_host_name = azurerm_storage_account.task07_sa.primary_blob_host
}