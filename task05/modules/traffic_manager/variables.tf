

variable "name" {
  description = "The name of the Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "traffic_routing_method" {
  description = "The traffic routing method (e.g., Performance, Priority, Weighted, Geographic)."
  type        = string
  default     = "Performance"
}

variable "relative_name" {
  description = "The relative DNS name for the Traffic Manager profile."
  type        = string
}

variable "ttl" {
  description = "The DNS TTL in seconds."
  type        = number
  default     = 30
}

variable "monitor_protocol" {
  description = "The protocol used for endpoint monitoring (HTTP, HTTPS, TCP)."
  type        = string
  default     = "HTTP"
}

variable "monitor_port" {
  description = "The port used for endpoint monitoring."
  type        = number
  default     = 80
}

variable "monitor_path" {
  description = "The path used for endpoint monitoring."
  type        = string
  default     = "/"
}

variable "monitor_interval_in_seconds" {
  description = "The interval in seconds for endpoint monitoring."
  type        = number
  default     = 30
}

variable "monitor_timeout_in_seconds" {
  description = "The timeout in seconds for endpoint monitoring."
  type        = number
  default     = 10
}

variable "monitor_tolerated_number_of_failures" {
  description = "The number of tolerated failures before marking endpoint as unhealthy."
  type        = number
  default     = 3
}

variable "azure_endpoints" {
  description = "A map of Azure endpoints for the Traffic Manager profile."
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number)
    priority           = optional(number)
  }))
}

variable "tags" {
  description = "A map of tags to assign to the Traffic Manager profile."
  type        = map(string)
  default     = {}
}
