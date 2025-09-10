variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the CDN resources."
}

variable "location" {
  type        = string
  description = "The Azure region where the CDN resources will be deployed."
}

variable "fd_profile_name" {
  type        = string
  description = "The name of the Azure CDN profile."
}
variable "fd_profile_sku" {
  type        = string
  description = "The SKU of the Azure CDN profile."
}

variable "fd_endpoint_name" {
  type        = string
  description = "The name of the Azure CDN endpoint."
}

variable "fd_origin_group_name" {
  type        = string
  description = "The name of the Azure CDN origin group."
}

variable "fd_origin_name" {
  type        = string
  description = "The name of the Azure CDN origin."
}

variable "fd_route_name" {
  type        = string
  description = "The name of the Azure CDN route."
}
