variable family_image {
  default = "debian-10"
  type = string
  description = "Familia da imagem a ser buscada"
}

variable project_image {
  default = "debian-cloud"
  type = string
  description = "Projeto da imagem a ser buscada"
}

variable name_vm {
  default = "vm0"
  type = string
  description = "Nome da vm"
  }

variable type_vm {
  default = "n1-standard-1"
  type = string
  description = "Tipo da vm"
}


variable rede_vm {
  default = "default"
  type = string
  description = "Rede (nome ou self_link) a ser usada"
}

variable zone_vm {
  default = "southamerica-east1-a"
  type = string
  description = "Zona da VM"
}
