output pip-id{
    value     = azurerm_public_ip.ppip.id
}

output "pip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "prip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}
