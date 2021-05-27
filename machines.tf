resource "google_compute_instance" "database" {
  name         = "database"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link

    access_config {
      // Ephemeral IP
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_instance" "web" {
  name         = "web"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link

    access_config {
      // Ephemeral IP
    }
  }

  depends_on = [
     google_compute_instance.database,
  ]

}

resource "google_compute_network" "vpc_network" {
  name = "batatinhas-vpc"
  auto_create_subnetworks = true
}


resource "google_compute_subnetwork" "test_subnetwork" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_disk" "default" {
  name  = "database-db"
  type  = "pd-standard"
  zone  = google_compute_instance.database.zone
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.database.id
}
