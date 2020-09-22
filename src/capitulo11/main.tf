module "modulo-rede-tf-chapter11-ex2" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.5"

  project_id   = var.projectid
  network_name = format("%s-%s", terraform.workspace, var.nomevpc)
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = var.nomesubnet1
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "southamerica-east1"
    }
  ]

}

module "modulo-lb-tf-chapter11" {
  source       = "GoogleCloudPlatform/lb/google"
  version      = "~> 2.3.0"
  region       = "us-central1"
  name         = "lb-tf-chapter11"
  service_port = 80
  target_tags  = ["allow-lb-web"]
  network      = module.modulo-rede-tf-chapter11-ex2.network_name
}
