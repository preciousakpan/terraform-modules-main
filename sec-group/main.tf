resource "azurerm_network_security_group" "pnsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg
}

resource "azurerm_subnet_network_security_group_association" "pnsga" {
  subnet_id                 = azurerm_subnet.psnet.id
  network_security_group_id = azurerm_network_security_group.pnsg.id
}

resource "azurerm_network_security_rule" "example" {
  name                        = "p80"
  priority                    = 201
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.prg.name
  network_security_group_name = azurerm_network_security_group.pnsg.name
}