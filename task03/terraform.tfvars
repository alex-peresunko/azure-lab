
# Resource Group
resource_group_name     = "cmaz-nw9g0zfg-mod3-rg"
resource_group_location = "West Europe"

# Storage Account
storage_account_name             = "cmaznw9g0zfgsa"
storage_account_tier             = "Standard"
storage_account_replication_type = "GRS"
storage_account_tags = {
  "environment" = "dev"
}

# VNET
vnet_name = "cmaz-nw9g0zfg-mod3-vnet"
vnet_address_space = [
  "10.0.0.0/16"
]

# Subnet frontend
subnet_frontend_name = "frontend"
subnet_frontend_address_prefixes = [
  "10.0.1.0/24"
]

# Subnet backend
subnet_backend_name = "backend"
subnet_backend_address_prefixes = [
  "10.0.2.0/24"
]

# Common variables
tag_creator = {
  "Creator" = "oleksandr_peresunko@epam.com"
}