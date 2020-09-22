variable "name" {
  default =  "vpc"
  type = string
}

variable "description" {
  default = "Criada pelo modulo vpc"
  type = string
}

variable "auto_subnet" {
  default = false
  type = bool
}

variable "routing_mode" {
  default = "GLOBAL"
  type = string
}
