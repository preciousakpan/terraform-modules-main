resource "azurerm_virtual_network" "v-net" {
  name                = var.vnet_name
  address_space       = var.vnet_ip
  location            = var.rg_location
  resource_group_name = var.rg_name
}
