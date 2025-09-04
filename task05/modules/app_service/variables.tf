variable "app_name" {
  type        = string
  description = "Name of the Web App"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "service_plan_id" {
  type        = string
  description = "App Service Plan ID"
}

variable "app_allow_ip_rule" {
  type = list(object({
    ip_address = string
    name       = string
    priority   = number
  }))
  description = "List of IP-based access rules"
  default     = []
}

variable "app_allow_tag_rule" {
  type = list(object({
    service_tag = string
    name        = string
    priority    = number
  }))
  description = "List of service tag-based access rules"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}