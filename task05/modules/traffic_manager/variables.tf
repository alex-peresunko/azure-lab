variable "name" {
  type        = string
  description = "The name of the Traffic Manager profile."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Traffic Manager profile."
}

variable "location" {
  type        = string
  description = "The Azure region where the Traffic Manager profile will be created."
}

variable "traffic_routing_method" {
  type        = string
  description = "The traffic routing method for the Traffic Manager profile. Possible values are 'Performance', 'Weighted', 'Priority', 'Geographic', 'Multivalue', and 'Subnet'."

}

variable "dns_config_relative_name" {
  type        = string
  description = "The relative name for the DNS configuration."
}

variable "dns_config_ttl" {
  type        = string
  description = "The TTL (Time to Live) for the DNS configuration."

}

variable "monitor_config" {
  type = object({
    protocol = string
    port     = number
    path     = string
  })
  description = "A map of monitor configuration settings for the Traffic Manager profile."
  default = {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number)
    priority           = optional(number)
  }))
  description = "A map of endpoints to add to the Traffic Manager profile. The key is a logical name, and the value contains the properties for the endpoint."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the Traffic Manager profile."
  default     = {}
}