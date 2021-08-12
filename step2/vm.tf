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
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = file("script.sh")

  provisioner "file" {
    source = "./secrets"
    destination = "/tmp/secrets"
    connection {
      type = "ssh"
      user = "root"
      host = self.network_interface.0.access_config.0.nat_ip
      private_key = file("./yes")
    }
  }

  metadata = {
    ssh-keys = format("%s:%s","root", file("yes.pub"))
  }

  provisioner "local-exec" {
    command = "touch provisionado-${count.index}" 
  }

  provisioner "remote-exec" {

  inline = [
    "mv /tmp/secrets /root",
    "chmod 400 /root/secrets",
  ]
  connection {
      type = "ssh"
      user = "root"
      host = self.network_interface.0.access_config.0.nat_ip
      private_key = file("./yes")
    }
  }
}
