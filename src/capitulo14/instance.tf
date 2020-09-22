resource "google_compute_instance" "import" {
  name         = "instance-1"
  machine_type = "g1-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "nixos-20-03"
    }
  }

  network_interface {
    network = "default"
  }
}
