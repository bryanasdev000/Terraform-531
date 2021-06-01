variable "vpc_name" {
  description = "O nome a ser utilizado para a VPC"
  type = string
}

variable "auto_create_subnetworks" {
  description = ""
  default = false
  type = bool
}

variable "subnet_name" {
  description = "O nome a ser utilizado para a Subnet"
  type = string
}

variable "subnet_cidr" {
  description = ""
  default = "10.2.0.0/16"
  type = string
}

variable "subnet_region" {
  description = ""
  default = "southamerica-east1"
  type = string
  sensitive = true
}

