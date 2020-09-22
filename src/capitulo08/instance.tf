resource "google_compute_instance" "vm0" {
  name         = var.nomevm
  machine_type = var.tipovm
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network =  google_compute_network.vpc0.self_link
    access_config {
    }
  }

}
