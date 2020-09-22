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
    network =  google_compute_network.vpc.self_link
    access_config {
    }
  }

}

resource "google_compute_instance" "vm1" {
  name         = format("%s-%s","gcp-vm",md5("cat"))
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
    network =  google_compute_network.vpc.self_link
    access_config {
    }
  }

}
