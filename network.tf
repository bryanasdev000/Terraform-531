resource "google_compute_network" "rede" {
  name = local.new-vpc-name
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "subrede" {
  name          = local.new-subnet-name
  ip_cidr_range = var.subnet_cidr
  region        = var.subnet_region
  network       = google_compute_network.rede.self_link
}

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

# self_link subnet
# gateway subnet
# CIDR subnet
# region subnet

output "vpc_selflink" {
  description = ""
  value = google_compute_network.rede.self_link
}
output "subnet_selflink" {
  description = ""
  value = google_compute_subnetwork.subrede.self_link
}
output "subnet_gateway" {
  description = ""
  value = google_compute_subnetwork.subrede.gateway_address
}
output "subnet_cidr" {
  description = ""
  value = google_compute_subnetwork.subrede.ip_cidr_range
}
output "subnet_region" {
  description = ""
  value = google_compute_subnetwork.subrede.region
  sensitive = true
}

locals {
  new-vpc-name = format("%s-%s", terraform.workspace, var.vpc_name)
  new-subnet-name = format("%s-%s", terraform.workspace, var.subnet_name)
}
