module "network" {
  source      = "./modules/network"
  vpc_name    = "rede"
  subnet_name = "sp"
}

#output "vpc_selflink" {
#  description = ""
#  #value = google_compute_network.rede.self_link
#  value = module.network.vpc_selflink
#}

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
    subnetwork = module.network.subnet_selflink

    access_config {
      // Ephemeral IP
    }
  }
}

module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "3.2.2"
  network_name = "rede-prod"
  project_id   = "rubeus-proxysql"
  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "asia-east1"
    }
  ]
}
