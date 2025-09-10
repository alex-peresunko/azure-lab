variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the CDN resources."
}

variable "location" {
  type        = string
  description = "The Azure region where the CDN resources will be deployed."
}

variable "cdn_profile_name" {
  type        = string
  description = "The name of the Azure CDN profile."
}

variable "cdn_endpoint_name" {
  type        = string
  description = "The name of the Azure CDN endpoint."
}

variable "origin_host_name" {
  type        = string
  description = "The hostname of the origin server for the CDN endpoint."
}
