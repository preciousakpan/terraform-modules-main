variable "vnet_name" {
    type        =   string
    description =   "Name of virtual network"
}

variable "vnet_ip" {
    type        =   list(string)
    description =   "Vnet CIDR"
}

variable "rg_location" {
    type        =   string
    description =   "Location of resource group"
}

variable "rg_name" {
    type        =   string
    description =   "Name of resource group"
}