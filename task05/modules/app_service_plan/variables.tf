variable "name" {
  type        = string
  description = "The name of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create the App Service Plan in."
}
variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "os_type" {
  type        = string
  description = "The operating system type for the App Service Plan. Possible values are 'Windows' and 'Linux'."
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the App Service Plan. Examples include 'F1', 'B1', 'S1', 'P1v2', etc."

}

variable "worker_count" {
  type        = number
  description = "The number of workers to be allocated to the App Service Plan."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource group."
  default     = {}
}