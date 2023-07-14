variable "nic_name" {
    type        =   string
    description =   "Name of NIC"
}

variable "ip_name" {
    type        =   string
    description =   "name of IP resource"
}

variable "rg_location" {
    type        =   string
    description =   "Location of resource group"
}

variable "rg_name" {
    type        =   string
    description =   "Name of resource group"
}

variable "snet_id" {
    type        =   string
    description =   "ID of subnet"
}

variable "username" {
    type        = string
    description = "Admin username"
}

variable "public_key" {
    type        = string
    description = "Path to Public SSH Key"
}

variable "vm_name" {
    type        = string
}


variable "pip_name" {
    type        = string
}
