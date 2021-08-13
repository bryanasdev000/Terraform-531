# VM
# Disco
# Anexar esse disco na minha VM

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.vm_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = var.vm_os
    }
  }

  network_interface {
    network = var.vm_net
    access_config {
    }
  }

}

resource "google_compute_disk" "default" {
  name = var.disk_name
  type = var.disk_type
  zone = google_compute_instance.default.zone
  size = var.disk_size
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.default.id
}


