resource "google_compute_instance" "app" {
  name         = format("%s-%s", "app", terraform.workspace)
  machine_type = "e2-medium"
  zone         = "southamerica-east1-b"

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

  tags = ["shellzao", "app"]

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = format("%s:%s", "root", file("chave.pub"))
  }

  provisioner "file" {
    source      = "./chave"
    destination = "/tmp/secret"
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.network_interface.0.access_config.0.nat_ip
      private_key = file("chave")
    }
  }

  provisioner "local-exec" {
    command = "date > final_provisionamento"
  }

  provisioner "remote-exec" {
    inline = [
      "cp /tmp/secret /root/.ssh/id_rsa",
      "chmod 400 -R /root/.ssh",
      "ssh-keygen -y -f /root/.ssh/id_rsa > /root/.ssh/id_rsa.pub"
    ]
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.network_interface.0.access_config.0.nat_ip
      private_key = file("chave")
    }
  }
}




