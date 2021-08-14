variable "name" {
  type        = string
  description = "Nome do grupo"
}

variable "base_instance_name" {
  type        = string
  description = "Prefixo das instancias"
}

variable "region" {
  type        = string
  description = "Região"
}

variable "distribution_policy_zones" {
  type        = list(string)
  description = "Zonas do grupo"
}

variable "instance_template" {
  type        = string
  description = "Self link do template"
}

variable "resource_depends_on" {
  type        = any
  description = "Depends_on do modulo"
  default     = null
}
