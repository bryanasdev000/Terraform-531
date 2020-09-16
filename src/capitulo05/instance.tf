resource "google_compute_instance" "vm0" {
  name         = "gcp-vm-0"
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
    network = "vpc0"
    access_config {
    }
  }
}
