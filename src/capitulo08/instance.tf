resource "google_compute_instance" "vm0" {
  name         = var.nome_maquina
  machine_type = var.tipo_maquina
  zone         = var.zona

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
