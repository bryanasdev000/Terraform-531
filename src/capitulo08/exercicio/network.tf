resource "google_compute_network" "vpc" {
  name = var.nomevpc
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.nomesubnet
  ip_cidr_range = var.cidr_subnet
  region        = "southamerica-east1"
  network       = google_compute_network.vpc.self_link
}
