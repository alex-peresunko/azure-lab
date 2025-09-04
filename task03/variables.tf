
variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "storage_account_tier" {
  description = "The tier of the Storage Account."
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type of the Storage Account."
  type        = string
}

variable "storage_account_tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "tag_creator" {
  description = "The creator of the resources."
  type        = map(string)
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "subnet_frontend_name" {
  description = "The name of the frontend subnet."
  type        = string
}

variable "subnet_frontend_address_prefixes" {
  description = "The address prefixes for the frontend subnet."
  type        = list(string)

}

variable "subnet_backend_name" {
  description = "The name of the backend subnet."
  type        = string
}

variable "subnet_backend_address_prefixes" {
  description = "The address prefixes for the backend subnet."
  type        = list(string)

}