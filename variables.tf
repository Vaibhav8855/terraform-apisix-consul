variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-apisix-consul"
}

variable "vnet_name" {
  default = "vnet-apisix-consul"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "aks_subnet_name" {
  default = "aks-subnet"
}

variable "aks_subnet_prefix" {
  default = "10.0.1.0/24"
}

variable "aks_cluster_name" {
  default = "aks-apisix-consul"
}

variable "node_count" {
  default = 2
}

variable "node_vm_size" {
  default = "Standard_D2_v3"
}

