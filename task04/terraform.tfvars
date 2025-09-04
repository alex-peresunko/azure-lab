
# Resource Group
resource_group_name     = "cmaz-nw9g0zfg-mod4-rg"
resource_group_location = "West Europe"

# VNET
vnet_name = "cmaz-nw9g0zfg-mod4-vnet"
vnet_address_space = [
  "10.0.0.0/16"
]

# Subnets
subnet_frontend_name = "frontend"
subnet_frontend_address_prefixes = [
  "10.0.1.0/24"
]

# NIC
network_interface_name = "cmaz-nw9g0zfg-mod4-nic"
public_ip_name = "cmaz-nw9g0zfg-mod4-pip"
dns_name_label = "cmaz-nw9g0zfg-mod4-nginx"

# NSG
nsg_name = "cmaz-nw9g0zfg-mod4-nsg"
nsg_inbound_http_rule_name = "AllowHTTP"
nsg_inbound_ssh_rule_name = "AllowSSH"

# VM
vm_name = "cmaz-nw9g0zfg-mod4-vm"
vm_os_version = "ubuntu-24_04-lts"
vm_sku = "Standard_F2s_v2"
vm_admin_username = "admin"
vm_admin_password = "MyCoolPa$$word&^Nobody76Knows:)"


# Common variables
tag_creator = {
  "Creator" = "oleksandr_peresunko@epam.com"
}