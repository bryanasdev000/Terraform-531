variable nome_maquina {
  type = string
  default = "vm-1"
  description = "Nome da instancia a ser criada"
}

variable tipo_maquina {
  type = string
  default = "n1-standard-1"
  description = "Tipo de maquina na GCP"
}

variable zona {
  type = string
  default = "southamerica-east1-a"
  description = "Zona a ser utilizada"
}
