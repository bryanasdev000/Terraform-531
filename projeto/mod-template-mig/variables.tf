variable "name" {
  type        = string
  description = "Prefixo do nome do instance template"
}

variable "desc" {
  type        = string
  default = ""
  description = "Descricao do instance template"
}

variable "machine_type" {
  type        = string
  description = "Tipo de maquina"
  default     = "f1-micro"
}

variable "instance_description" {
  default = ""
  type        = string
  description = "Descricao da instancia"
}

variable "labels" {
  type        = map
  description = "Labels da instancia"
  default     = {}
}

variable "tags" {
  type        = list
  description = "Tags da instancia"
  default     = []
}

variable "can_ip_forward" {
  type        = bool
  description = "Roteamento de pacotes"
  default     = false
}

variable "network" {
  type        = string
  description = "VPC da instancia"
}

variable "subnetwork" {
  type        = string
  description = "Subnet da instancia"
}

variable "metadata_startup_script" {
  type        = string
  description = "Caminho do script shell do userdata"
  default      = null
}

variable "on_host_maintenance" {
  type        = string
  description = "Host Maintanance da instancia"
  default     = "MIGRATE"
}

variable "automatic_restart" {
  type        = bool
  description = "Automatic restart da instancia"
  default     = true
}

variable "source_image" {
  type        = string
  description = "Imagem base"
  default     = "debian-cloud/debian-10"
}

variable "auto_delete" {
  type        = bool
  description = "Auto delete da instancia"
  default     = true
}

variable "boot" {
  type        = bool
  description = "Boot disk"
  default     = true
}
