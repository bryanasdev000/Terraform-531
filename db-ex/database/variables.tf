
variable "vm_name" {
  type        = string
  description = ""
}

variable "vm_zone" {
  type        = string
  description = ""
}

variable "vm_type" {
  type        = string
  description = ""
}

variable "vm_net" {
  type        = string
  description = ""
}

variable "vm_os" {
  type    = string
  default = "debian-cloud/debian-10"
}

variable "disk_size" {
  type = number
}

variable "disk_type" {
  type    = string
  default = "pd-ssd"
}

variable "disk_name" {
  type = string
}
