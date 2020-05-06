data "google_compute_image" "image" {
  family  = var.family_image
  project = var.project_image
}

resource "google_compute_instance" "vm" {
  name         = var.name_vm
  machine_type = var.type_vm
  zone         = var.zone_vm

  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.rede_vm

    access_config {
    }
  }
}
