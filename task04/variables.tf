
variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "tag_creator" {
  description = "The creator of the resources."
  type        = map(string)
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "subnet_frontend_name" {
  description = "The name of the frontend subnet."
  type        = string
}

variable "subnet_frontend_address_prefixes" {
  description = "The address prefixes for the frontend subnet."
  type        = list(string)

}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
}

variable "nic_ip_configuration_name" {
  description = "The name of the IP configuration for the network interface."
  type        = string
}

variable "nic_ip_configuration_private_ip_allocation" {
  description = "The private IP allocation method for the network interface."
  type        = string

}
variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
}

variable "nsg_inbound_http_rule_name" {
  description = "The name of the inbound HTTP rule for the network security group."
  type        = string
}

variable "nsg_inbound_ssh_rule_name" {
  description = "The name of the inbound SSH rule for the network security group."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
}

variable "dns_name_label" {
  description = "The DNS name label for the public IP address."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_publisher" {
  description = "The publisher of the virtual machine image."
  type        = string
}

variable "vm_offer" {
  description = "The offer of the virtual machine image."
  type        = string
}

variable "vm_os_version" {
  description = "The OS version of the virtual machine."
  type        = string
}

variable "vm_sku" {
  description = "The SKU of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "vm_password" {
  description = "The admin password for the virtual machine."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.vm_password) >= 12
    error_message = "Password must be at least 12 characters."
  }
}