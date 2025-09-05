module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.common_tags
}

module "app_service_plans" {
  source              = "./modules/app_service_plan"
  for_each            = var.app_service_plans
  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.common_tags
}

module "app_services" {
  source              = "./modules/app_service"
  for_each            = var.app_services
  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.resource_group_key].name
  location            = module.resource_groups[each.value.resource_group_key].location
  app_service_plan_id = module.app_service_plans[each.value.app_service_plan_key].id
  site_config         = lookup(var.app_service_site_config, each.key, {})
  ip_restriction      = var.app_service_ip_restriction
  tags                = var.common_tags
}

module "traffic_manager" {
  source                   = "./modules/traffic_manager"
  name                     = var.traffic_manager_name
  tags                     = var.common_tags
  dns_config_relative_name = var.traffic_manager_dns_config_relative_name
  dns_config_ttl           = var.traffic_manager_dns_config_ttl
  resource_group_name      = module.resource_groups[var.traffic_manager_resource_group_key].name
  location                 = var.traffic_manager_location
  traffic_routing_method   = var.traffic_manager_traffic_routing_method
  monitor_config           = var.traffic_manager_monitor_config
  endpoints = {
    for app_key, app in var.traffic_manager_endpoints :
    app_key => {
      name               = app.name
      target_resource_id = module.app_services[app.target_resource_id_key].id
      weight             = app.weight
      priority           = app.priority
    }
  }
}