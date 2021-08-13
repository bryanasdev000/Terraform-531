resource "google_compute_instance" "vm" {
  name         = var.vm_name 
  machine_type = var.vm_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = var.vm_os
    }
  }

  network_interface {
    network = module.vpc.selflink_vpc

    access_config {
      // Ephemeral IP
    }
  }

}


