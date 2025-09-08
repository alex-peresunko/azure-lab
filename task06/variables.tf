variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault will be created."
}

variable "common_tags" {
  type        = map(string)
  description = "A map of tags to assign"
  default     = {}
}

variable "key_vault_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "The name of the resource group where the Key Vault is located."
}

variable "key_vault_secret_name_username" {
  type        = string
  description = "The name of the secret in Key Vault to store the SQL admin username."
}

variable "key_vault_secret_name_password" {
  type        = string
  description = "The name of the secret in Key Vault to store the SQL admin password."
}


# SQL Server variables
variable "sql_server_name" {
  type        = string
  description = "The name of the SQL server."
}

variable "sql_server_version" {
  type        = string
  description = "The version of the SQL server."
}

variable "sql_allowed_ip_address" {
  type        = string
  description = "The specific public IP address to allow access to the SQL server for development."
}