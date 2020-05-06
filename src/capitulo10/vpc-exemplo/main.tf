resource "google_compute_network" "vpc_network" {
  name = var.nome_vpc
  description = var.desc_vpc
  auto_create_subnetworks = var.cria_subnet
}



resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.nome_subnet
  ip_cidr_range = var.cidr
  region        = var.regiao
  network       = google_compute_network.vpc_network.self_link
}

