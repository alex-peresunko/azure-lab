
variable "name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service Plan will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "kind" {
  description = "The kind of App Service Plan (e.g., Linux, Windows)."
  type        = string
  default     = "Linux"
}

variable "reserved" {
  description = "Is this App Service Plan reserved for Linux?"
  type        = bool
  default     = true
}

variable "sku_tier" {
  description = "The SKU tier for the App Service Plan (e.g., Basic, Standard, Premium)."
  type        = string
}

variable "sku_size" {
  description = "The SKU size for the App Service Plan (e.g., B1, S1, P1v2)."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the App Service Plan."
  type        = map(string)
  default     = {}
}
