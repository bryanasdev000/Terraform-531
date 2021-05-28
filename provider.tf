resource "google_compute_instance" "teste" {
  name         = format("%s-%s", "teste", terraform.workspace)
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = format("%s:%s", "root", file("chave.pub"))
  }
}


resource "google_compute_instance" "shell" {
  name         = format("%s-%s", "shell", terraform.workspace)
  machine_type = "e2-medium"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = format("%s:%s", "root", file("chave.pub"))
  }

  #provisioner "file" {
  #  source = "./chave"
  #  destination = "/tmp/secret"
  #  connection {
  #  type     = "ssh"
  #  user     = "root"
  #  host     = self.network_interface.0.access_config.0.nat_ip
  #}

  #}

}




