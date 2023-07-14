
variable "vnet_name" {
    type        =   string
    description =   "Name of virtual network"
}

variable "rg_name" {
    type        =   string
    description =   "Name of resource group"
}

variable "snet_name" {
    type        =   string
    description =   "name of subnet"
}

variable "snet_ip" {
    type        = list(string)
    description = "Subnet CIDR"
}