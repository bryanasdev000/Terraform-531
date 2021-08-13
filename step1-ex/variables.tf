#variable "disk_name" {
#  type = string
#  default = "web-disco"
#  description = ""
#}
#
#variable "disk_type" {
#  type = string
#  default = "pd-ssd"
#  description = ""
#}
#
#variable "disk_size" {
#  type = number
#  description = ""
#}
#
variable "vm_name" {
  type = string
  description = ""
}

variable "vm_type" {
  type = string
  description = ""
}

variable "vm_zone" {
  type = string
  description = ""
}

variable "vm_os" {
  default = "debian-cloud/debian-10"
  type = string
  description = ""
}
#
#
