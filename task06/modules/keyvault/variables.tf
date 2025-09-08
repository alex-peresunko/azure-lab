variable "name" {
  type        = string
  description = "The name of the Key Vault." 
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create the Key Vault in."
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the Key Vault. Possible values are 'standard' and 'premium'."
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault."
}

variable "access_policies" {
  type = list(object({
    tenant_id           = string
    object_id           = string
    application_id      = optional(string)
    key_permissions     = list(string)
    secret_permissions  = list(string)
    certificate_permissions = optional(list(string))
    storage_permissions     = optional(list(string))
  }))
  description = "A list of access policy objects defining the access policies for the Key Vault."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the Key Vault."
  default     = {}
}