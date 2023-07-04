terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.62.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features{}
}

resource "azurerm_resource_group" "p-rg" {
  name     = "peeee"
  location = "Uk South"
}


module "vnet" {
  source            = "./network"
  vnet_name         = "vn1"
  vnet_ip           = ["10.0.0.0/16"]
  rg_location       = azurerm_resource_group.p-rg.location
  rg_name           = azurerm_resource_group.p-rg.name
  snet_name         = "sn1"
  snet_ip           = ["10.0.1.0/24"]
}

module "vm" {
    source          = "./vm"
    nic_name        = "nic1"
    ip_name         = "ip1"
    rg_location     = azurerm_resource_group.p-rg.location
    rg_name         = azurerm_resource_group.p-rg.name
    snet_id         = module.vnet.snet-id
    username        = "puser"
    public_key      = "key.pub"
    vm_name         = "vmmm"
    pip_name        = "pip1"
    pip_id          = module.vm.pip-id
}

output "public-ip"{
  value = module.vm.pip
}

output "private-ip"{
  value = module.vm.prip
}