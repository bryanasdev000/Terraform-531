variable nome_vpc {
  type = string
  default = "padrao"
  description = "Nome da vpc a ser criada"
}

variable cria_subnet {
  type = bool
  default = false
  description = "Flag cria subnet"
}

variable desc_vpc {
  type = string
  default = ""
  description = "Descricao da VPC a ser criada"
}

variable nome_subnet {
  type = string
  default = "padrao-subnet"
  description = "Nome da subnet a ser criada"
}

variable cidr {
  type = string
  default = "10.2.0.0/16"
  description = "Faixa de ip a ser usada"
}

variable regiao {
  type = string
  default = "southamerica-east1"
  description = "Regiao da subnet"
}
