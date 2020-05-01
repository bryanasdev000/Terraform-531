resource "google_compute_instance" "vm0" {
  name         = var.nome_instancia
  machine_type = var.tipo_instancia
  zone         = var.zona

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = google_compute_network.vpc.self_link

    access_config {
      // Ephemeral IP
    }
  }

}
