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

locals {
  counter   = 2
  subnet    = [["10.0.1.0/24"], ["10.0.2.0/24"]]
}

resource "azurerm_resource_group" "p-rg" {
  name     = "peeee3"
  location = "Uk South"
}


module "vnet" {
  source            = "./network"
  vnet_name         = "vn"
  vnet_ip           = ["10.0.0.0/16"]
  rg_location       = azurerm_resource_group.p-rg.location
  rg_name           = azurerm_resource_group.p-rg.name
}

module "snet" {
  count             = local.counter
  source            = "./subnet"
  rg_name           = azurerm_resource_group.p-rg.name
  vnet_name         = module.vnet.vnet-name
  snet_name         = "sn-${count.index + 1}"
  snet_ip           = local.subnet[count.index]
}

module "vm" {
    count           = local.counter
    source          = "./vm"
    nic_name        = "nic-${count.index + 1}"
    ip_name         = "ip-${count.index + 1}"
    rg_location     = azurerm_resource_group.p-rg.location
    rg_name         = azurerm_resource_group.p-rg.name
    snet_id         = module.snet[count.index].snet-id
    username        = "puser"
    public_key      = "key.pub"
    vm_name         = "vm-${count.index + 1}"
    pip_name        = "pip-${count.index + 1}"
}

output "public-ip"{
  value = module.vm[*].pip
}

output "private-ip"{
  value = module.vm[*].prip
}