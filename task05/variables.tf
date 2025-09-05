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

variable "app_services" {
  type = map(object({
    name                 = string,
    resource_group_key   = string,
    app_service_plan_key = string,
  }))
  description = "A map of App Services to create. The key is a logical name, and the value contains the properties for the App Service."

}

variable "app_service_site_config" {
  type        = map(any)
  description = "A map of site configuration settings for the App Service."
  default     = {}
}

variable "app_service_ip_restriction" {
  type = list(object({
    ip_address  = string
    action      = string
    priority    = number
    name        = string
    description = optional(string)
    headers     = optional(map(string))
    subnet_id   = optional(string)
  }))
  description = "A list of IP restriction rules for the App Service."
}