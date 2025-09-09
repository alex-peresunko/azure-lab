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

variable "sql_server_version" {
  type        = string
  description = "The version of the SQL server."
}

variable "sql_allowed_ip_address" {
  type        = string
  description = "The specific public IP address to allow access to the SQL server for development."
}

# App Service variables

variable "asp_location" {
  type        = string
  description = "The Azure region where the App Service Plan will be created."

}

variable "asp_os_type" {
  type        = string
  description = "The operating system type for the App Service Plan. Possible values are 'Windows' and 'Linux'."
}

variable "asp_sku_name" {
  type        = string
  description = "The SKU name for the App Service Plan. Examples include 'F1', 'B1', 'S1', 'P1v2', etc."

}

variable "asp_worker_count" {
  type        = number
  description = "The number of workers to be allocated to the App Service Plan."
}
variable "app_tags" {
  type        = map(string)
  description = "A map of tags to assign to the App Service."
  default     = {}
}

variable "app_dotnet_version" {
  type = string
}

variable "app_ip_restriction" {
  type = list(object({
    ip_address  = optional(string)
    action      = string
    priority    = number
    name        = string
    description = optional(string)
    headers     = optional(map(string))
    subnet_id   = optional(string)
    service_tag = optional(string)
  }))
  description = "A list of IP restriction rules for the App Service."
  default     = []

}

# SQL Database variables
variable "sql_database_collation" {
  type        = string
  description = "The collation of the SQL database."
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sql_database_sku_name" {
  type        = string
  description = "The SKU name for the SQL database. Examples include 'Basic', 'Standard', 'Premium', etc."
  default     = "Basic"
}

variable "sql_database_max_size_gb" {
  type        = number
  description = "The maximum size of the SQL database in GB."
  default     = 2
}

