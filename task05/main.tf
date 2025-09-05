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