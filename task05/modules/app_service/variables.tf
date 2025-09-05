variable "name" {
  type        = string
  description = "The name of the App Service."
}

variable "location" {
  type        = string
  description = "The Azure region where the App Service will be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the App Service."
}

variable "app_service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan to use for the App Service."
}

variable "site_config" {
  type        = map(any)
  description = "A map of site configuration settings for the App Service."
  default     = {}

}

variable "ip_restriction" {
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
  default = [
    {
      ip_address  = "0.0.0.0/0"
      action      = "Deny"
      priority    = 65000
      name        = "DenyAll"
      description = "Deny all traffic by default"
    }
  ]

}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource group."
  default     = {}
}