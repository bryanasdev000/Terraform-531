variable "name" {
  default =  "subnet"
  type = string
}

variable "description" {
  default = "Criada pelo modulo subnet"
  type = string
}

variable "cidr" {
  default = "10.0.0.0/22"
  type = string
}

variable "network" {
  type = string
  description = "self_link da vpc"
}

variable "bigbrother" {
  default = true
  type = bool
}

variable "region" {
  default = "southamerica-east1"
  type = string
}

