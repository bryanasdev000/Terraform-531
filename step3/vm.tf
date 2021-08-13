resource "google_compute_instance" "web" {
  name         = format("%s-%s-%s",terraform.workspace, var.vm_name, count.index)
  machine_type = var.vm_type
  zone         = var.vm_zone

  count = var.vm_count
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = data.google_compute_network.rede-externa.name
    access_config {
    }
  }

}

data "google_compute_network" "rede-externa" {
    name = "pizza"
}
