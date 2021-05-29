data "google_compute_network" "my-network" {
  name = "default"
}

data "http" "example" {
  url = "https://desafiotestes.free.beeceptor.com"
  request_headers = {
    Accept = "application/json"
  }
}

resource "google_compute_instance" "app" {
  name         = format("%s-%s", "app", terraform.workspace)
  machine_type = "e2-medium"
  zone         = "southamerica-east1-b"
  
  metadata = {
    api = data.http.example.body
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network = data.google_compute_network.my-network.self_link # "default"

    access_config {
      // Ephemeral IP
    }
  }

}
