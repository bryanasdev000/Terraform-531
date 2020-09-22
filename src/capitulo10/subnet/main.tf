resource "google_compute_subnetwork" "this" {
  name = var.name
  ip_cidr_range = var.cidr
  network = var.network
  description = var.description
  private_ip_google_access = var.bigbrother
  region = var.region
}
