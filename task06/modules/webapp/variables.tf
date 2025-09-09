variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create the App Service Plan in."
}

variable "asp_name" {
  type        = string
  description = "The name of the App Service."
}
variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created."
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

variable "asp_tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource group."
  default     = {}
}


# --- App Service specific variables ---

variable "app_name" {
  type        = string
  description = "The name of the App Service."
}

variable "app_dotnet_version" {
  type = string
}

variable "app_tags" {
  type        = map(string)
  description = "A map of tags to assign to the App Service."
  default     = {}
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

variable "sql_connection_string" {
  type        = string
  description = "The connection string for the App Service to connect to the SQL database."
  sensitive   = true
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault."
}