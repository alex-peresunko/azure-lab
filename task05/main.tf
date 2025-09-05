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