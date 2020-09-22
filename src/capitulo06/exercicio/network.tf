resource "google_compute_network" "vpc" {
  name = "vpcex"
  auto_create_subnetworks = true
}
