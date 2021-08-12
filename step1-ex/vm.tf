resource "google_compute_instance" "vm" {
  name         = format("%s-%s",terraform.workspace, "web")
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.rede.name

    access_config {
      // Ephemeral IP
    }
  }

}
