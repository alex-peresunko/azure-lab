variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource groups to create. The key is a logical name, and the value contains the name and location for Azure."
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources."
  default = {
    Creator = "oleksandr_peresunko@epam.com"
  }
}

variable "app_service_plans" {
  type = map(object({
    name               = string,
    resource_group_key = string,
    os_type            = string,
    sku_name           = string,
    worker_count       = number,
  }))
  description = "A map of App Service Plans to create. The key is a logical name, and the value contains the properties for the App Service Plan."
}