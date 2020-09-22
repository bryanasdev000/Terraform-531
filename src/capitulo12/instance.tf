resource "google_compute_instance" "vm" {
  count = terraform.workspace == "prd" ? 3 : 1
  name         = format("%s-%s-%s",terraform.workspace,"vm", count.index)
  machine_type = "n1-standard-1"
  zone = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
    auto_delete = terraform.workspace == "prd" ? false : true 
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
