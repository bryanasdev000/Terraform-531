# Descricao
# Boa parte do codigo que esta aqui e "boilerplate"
# em outras palavras, codigo pronto que esta na documentacao,
# apenas parametrizado (variables\outputs).

# Rede (VPC + Subnet)
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "3.3.0"

  project_id   = "rubeus-proxysql"
  network_name = "ha-final"

  subnets = [
    {
      subnet_name   = "subnet-us"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "subnet-asia"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "asia-east1"
    }
  ]
}

# Firewall
resource "google_compute_firewall" "fw-dev" {
  name    = "fw-dev"
  network = module.vpc.network_self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "fw-lb" {
  name    = "fw-lb"
  network = module.vpc.network_self_link
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}


# Infos da subnet
# Preciso registrar o self_link das subnets corretamente, como estou usando modulo
# estou buscando por um datasource.
data "google_compute_subnetwork" "subnet-us" {
  name       = "subnet-us"
  region     = "us-central1"
  depends_on = [module.vpc]
}

data "google_compute_subnetwork" "subnet-asia" {
  name       = "subnet-asia"
  region     = "asia-east1"
  depends_on = [module.vpc]
}

# Templates
module "instance-template-us" {
  source                  = "./mod-template-mig"
  name                    = "us"
  metadata_startup_script = "./scripts/us.sh"
  network                 = module.vpc.network_self_link
  subnetwork              = data.google_compute_subnetwork.subnet-us.self_link
}

module "instance-template-asia" {
  source                  = "./mod-template-mig"
  name                    = "asia"
  metadata_startup_script = "./scripts/asia.sh"
  network                 = module.vpc.network_self_link
  subnetwork              = data.google_compute_subnetwork.subnet-asia.self_link
}

# Instance Groups
module "mig-us" {
  source                    = "./mod-mig"
  name                      = "mig-us"
  base_instance_name        = "us-web"
  region                    = "us-central1"
  instance_template         = module.instance-template-us.self_link
  distribution_policy_zones = ["us-central1-a", "us-central1-b"]
  resource_depends_on       = [module.vpc]
}

module "mig-asia" {
  source                    = "./mod-mig"
  name                      = "mig-asia"
  base_instance_name        = "asia-web"
  region                    = "asia-east1"
  instance_template         = module.instance-template-asia.self_link
  distribution_policy_zones = ["asia-east1-a"]
  resource_depends_on       = [module.vpc]
}

# Loadbalance
module "mod-lb" {
  source = "./mod-lb"
  backends = [
    module.mig-us.instance_group,
    module.mig-asia.instance_group
  ]
}

output "lb-ip" {
  value = module.mod-lb.ip
}


# Demo count + if 

resource "google_compute_instance" "bastion" {
  count = terraform.workspace == "prd" ? 3 : 2
  name         = format("%s-%s", "bastion", count.index)
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet-us.self_link

    access_config {
      // Ephemeral IP
    }
  }
}

