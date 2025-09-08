variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sql_server_name" {
  type        = string
  description = "The name of the SQL server."
}

variable "location" {
  type        = string
  description = "The Azure region where the SQL server will be created."
}

variable "sql_server_version" {
  type        = string
  description = "The version of the SQL server."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
  default     = {}
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault."
}

variable "key_vault_secret_name_username" {
  type        = string
  description = "The name of the secret in Key Vault to store the SQL admin username."
}

variable "key_vault_secret_name_password" {
  type        = string
  description = "The name of the secret in Key Vault to store the SQL admin password."
}

variable "sql_allowed_ip_address" {
  type        = string
  description = "The specific public IP address to allow access to the SQL server for development."
}