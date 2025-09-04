output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.task04_public_ip.ip_address
}

output "vm_fqdn" {
  description = "Fully qualified domain name of the VM"
  value       = azurerm_public_ip.task04_public_ip.fqdn
}