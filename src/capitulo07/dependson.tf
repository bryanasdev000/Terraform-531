resource "google_compute_instance" "vma" {
  name         = "instancia-a"
  machine_type = "n1-standard-1"
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
    network = "default"
    access_config {
    }
  }
}


resource "google_compute_instance" "vmb" {
  name         = "instancia-b"
  machine_type = "n1-standard-1"
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
    network = "default"
    access_config {
    }
  }

  depends_on = [
     google_compute_instance.vma
  ]
}
