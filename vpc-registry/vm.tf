resource "google_compute_instance" "web" {
  name         = format("%s-%s", var.vm_name, random_id.server.dec)  
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = module.vpc.network_self_link
    access_config {
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "random_id" "server" {
  keepers = {
    id = var.vm_name
  }

  byte_length = 2
}
