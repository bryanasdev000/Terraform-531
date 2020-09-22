resource "google_compute_network" "vpc" {
  name = "vpcex2"
  auto_create_subnetworks = true
}
