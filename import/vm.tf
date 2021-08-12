resource "google_compute_instance" "import" {
  name         = "teste"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

      service_account {
           email  = "525642465324-compute@developer.gserviceaccount.com"
           scopes = [
               "https://www.googleapis.com/auth/devstorage.read_only",
               "https://www.googleapis.com/auth/logging.write",
               "https://www.googleapis.com/auth/monitoring.write",
               "https://www.googleapis.com/auth/service.management.readonly",
               "https://www.googleapis.com/auth/servicecontrol",
               "https://www.googleapis.com/auth/trace.append",
            ]
        }


}
