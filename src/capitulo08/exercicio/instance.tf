resource "google_compute_instance" "vm" {
  count = local.qtd
  name         = format("%s-%s","vm-", count.index)
  machine_type = "n1-standard-1"
  zone         = var.zonas[count.index]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    subnetwork =  google_compute_subnetwork.subnet.self_link
    access_config {
    }
  }

}
