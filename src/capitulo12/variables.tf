# VAR LOCAL MOSTRAR

variable "nomessd" {
  default = "ssd-vm"
  description = "nome base do ssd"
  type = string
}

variable "nomesubnet" {
  default = "subnetsp"
  description = "Nome da subnet"
  type = string
}

variable "nomevpc" {
  default = "vpc"
  description = "Nomde da VPC"
  type = string
}

variable "cidr_subnet" {
  default = "10.240.1.0/24"
  description = "CIDR da subnet"
  type = string
}

#variable "qtd" {
#  default = 2
#  description = "Qtd de vms e ssds"
#  type = number
#}

variable "zonas" {
  type = list
  description = "zonas"
  default = ["southamerica-east1-a", "southamerica-east1-a", "southamerica-east1-a"]
}

locals {
  # dita a quantidade de recursos com base na lista de zonas
  qtd = length(var.zonas)
}

