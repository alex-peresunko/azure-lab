resource "azurerm_resource_group" "task04_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tag_creator
}

resource "azurerm_virtual_network" "task04_vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.task04_rg.location
  resource_group_name = azurerm_resource_group.task04_rg.name
  address_space       = var.vnet_address_space
  tags                = var.tag_creator
}

resource "azurerm_subnet" "task04_subnet_frontend" {
  name                 = var.subnet_frontend_name
  resource_group_name  = azurerm_resource_group.task04_rg.name
  virtual_network_name = azurerm_virtual_network.task04_vnet.name
  address_prefixes     = var.subnet_frontend_address_prefixes
}

resource "azurerm_network_interface" "task04_nic" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.task04_rg.location
  resource_group_name = azurerm_resource_group.task04_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.task04_subnet_frontend.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tag_creator
}

resource "azurerm_network_security_group" "task04_nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.task04_rg.location
  resource_group_name = azurerm_resource_group.task04_rg.name
  tags                = var.tag_creator
}

resource "azurerm_network_security_rule" "task04_nsg_http" {
  name                        = var.nsg_inbound_http_rule_name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = azurerm_resource_group.task04_rg.name
  network_security_group_name = azurerm_network_security_group.task04_nsg.name
}

resource "azurerm_network_security_rule" "task04_nsg_ssh" {
  name                        = var.nsg_inbound_ssh_rule_name
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  resource_group_name        = azurerm_resource_group.task04_rg.name
  network_security_group_name = azurerm_network_security_group.task04_nsg.name
}

resource "azurerm_network_interface_security_group_association" "task04_nic_nsg" {
  network_interface_id      = azurerm_network_interface.task04_nic.id
  network_security_group_id = azurerm_network_security_group.task04_nsg.id
}

resource "azurerm_public_ip" "task04_public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.task04_rg.location
  resource_group_name = azurerm_resource_group.task04_rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = var.dns_name_label
  tags                = var.tag_creator
}


resource "azurerm_virtual_machine" "task04_vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.task04_rg.location
  resource_group_name   = azurerm_resource_group.task04_rg.name
  network_interface_ids = [azurerm_network_interface.task04_nic.id]
  vm_size              = var.vm_sku

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.vm_admin_username
    admin_password = var.vm_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.tag_creator

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.task04_public_ip.ip_address
    user        = var.vm_admin_username
    password    = var.vm_admin_password
    port        = 22
    timeout     = "2m"
    bastion_host = null
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ] 
  }
}
