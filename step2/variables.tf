variable "vm_name" {
  description = "Nome da VM a ser criada"
  type = string
}

variable "vm_zone" {
  description = "Zona onde a VM vai ser criada"
  type = string
  default = "us-central1-a"
}

variable "vm_type" {
  description = "Tipo de VM a ser criada"
  type = string
  default = "e2-small"
}

variable "vm_count" {
  description = "Quantidade de VMs a serem criadas"
  type = number
  default = 2
}
