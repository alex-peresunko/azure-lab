variable "resource_group_name" {
  description = "The name of the existing resource group."
  type        = string

}
variable "resource_group_id" {
  description = "The ID of the existing resource group."
  type        = string

}

variable "storage_account_name" {
  description = "The name of the existing storage account."
  type        = string

}
variable "storage_account_id" {
  description = "The ID of the existing storage account."
  type        = string

}

variable "fd_profile_name" {
  description = "The name of the CDN Front Door profile."
  type        = string
}

variable "fd_profile_sku" {
  description = "The SKU of the CDN Front Door profile."
  type        = string
}

variable "fd_endpoint_name" {
  description = "The name of the CDN Front Door endpoint."
  type        = string
}

variable "fd_origin_group_name" {
  description = "The name of the CDN Front Door origin group."
  type        = string
}

variable "fd_origin_name" {
  description = "The name of the CDN Front Door origin."
  type        = string
}

variable "fd_route_name" {
  description = "The name of the CDN Front Door route."
  type        = string
}

variable "filename_sa" {
  description = "The name of the file to be uploaded to the storage account."
  type        = string
}