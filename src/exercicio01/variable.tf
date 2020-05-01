variable nome_disco {
  type = string
  default = "disk0"
  description = "Nome do disco"
}

variable tipo_disco {
  type = string
  default = "pd-ssd"
  description = "Tipo do disco"
}

variable tamanho {
  type = number
  default = 20
  description = "Tamanho do disco"
}

variable zona {
  type = string
  default = "southamerica-east1-a"
  description = "Zona dos recursos"
}

variable nome_instancia {
  type = string
  default = "vm0"
  description = "Nome da maquina"
}

variable tipo_instancia {
  type = string
  default = "n1-standard-1"
  description = "Tipo da maquina"
}

variable nome_vpc {
  type = string
  default = "vpc-gcp"
  description = "Nome da VPC"
}

variable nome_regra {
  type = string
  default = "fw-rule-ssh"
  description = "Nome da regra de firewall para o SSH"
}
