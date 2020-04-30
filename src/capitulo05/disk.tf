resource "google_compute_disk" "disk0" {
  name                      = "vm0-extendido"
  type                      = "pd-ssd"
  zone                      = "southamerica-east1-a"
  physical_block_size_bytes = 4096
}
