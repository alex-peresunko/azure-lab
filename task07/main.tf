module "cdn" {
  source = "./modules/cdn"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  fd_profile_name      = var.fd_profile_name
  fd_profile_sku       = var.fd_profile_sku
  fd_endpoint_name     = var.fd_endpoint_name
  fd_origin_name       = var.fd_origin_name
  fd_origin_group_name = var.fd_origin_group_name
  fd_route_name        = var.fd_route_name
}