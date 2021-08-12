resource "google_compute_instance" "web" {
  name         = format("%s-%s-%s",terraform.workspace, "web", count.index)
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  count = terraform.workspace == "default" ? 5 : 2
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  depends_on = [google_compute_instance.database]

}
