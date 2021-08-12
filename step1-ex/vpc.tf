resource "google_compute_network" "rede" {
  name = format("%s-%s",terraform.workspace, "rede-alfa")
}
