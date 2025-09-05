output "resource_group_names" {
  value = { for rg in module.resource_groups : rg.name => rg.location }
}