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
    action      = string
    priority    = number
    name        = string
    ip_address  = optional(string)
    service_tag = optional(string)
    description = optional(string)
    headers     = optional(map(string))
    subnet_id   = optional(string)
  }))
  description = "A list of IP restriction rules for the App Service."
}

variable "traffic_manager_name" {
  type        = string
  description = "The name of the Traffic Manager profile."

}

variable "traffic_manager_resource_group_key" {
  type        = string
  description = "The resource group key where the Traffic Manager profile will be created."
}

variable "traffic_manager_location" {
  type        = string
  description = "The Azure region where the Traffic Manager profile will be created."
}

variable "traffic_manager_traffic_routing_method" {
  type        = string
  description = "The traffic routing method for the Traffic Manager profile. Possible values are 'Performance', 'Weighted', 'Priority', 'Geographic', 'Multivalue', and 'Subnet'."
}

variable "traffic_manager_dns_config_relative_name" {
  type        = string
  description = "The relative name for the DNS configuration."
}

variable "traffic_manager_dns_config_ttl" {
  type        = number
  description = "The TTL (Time to Live) for the DNS configuration."
}

variable "traffic_manager_monitor_config" {
  type = object({
    protocol = string
    port     = number
    path     = string
  })
  description = "A map of monitor configuration settings for the Traffic Manager profile."
}

variable "traffic_manager_endpoints" {
  type = map(object({
    name                   = string
    target_resource_id_key = string
    weight                 = optional(number)
    priority               = optional(number)
  }))
  description = "A map of endpoints to add to the Traffic Manager profile. The key is a logical name, and the value contains the properties for the endpoint."
  default     = {}
}
