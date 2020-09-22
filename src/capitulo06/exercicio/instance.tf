resource "google_compute_instance" "vm0" {
  name         = format("%s-%s","gcp-vm",md5("dog"))
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
    network =  "vpcex"
    access_config {
    }
  }

}
