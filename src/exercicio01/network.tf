resource "google_compute_network" "vpc" {
  name = var.nome_vpc
  }

resource "google_compute_firewall" "fw-ssh" {
  name    = var.nome_regra
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] 
}
