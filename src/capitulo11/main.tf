module "gcp-network" {
  source       = "terraform-google-modules/network/google"
  version      = "2.0.1"

  # input do modulo
  network_name = "aula5"
  project_id = "id-do-seu-projeto"
  subnets = [
    {
      subnet_name   = "aula5-sp"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "southamerica-east1"
    },
    {
      subnet_name   = "aula5-us"
      subnet_ip     = "10.10.11.0/24"
      subnet_region = "us-central1"
    }
  ]
}


output "nome_rede_modulo" {
  value = module.gcp-network.network_name
  description = "Nome da VPC (modulo)"
}

output "nome_subrede_modulo" {
  value = module.gcp-network.subnets_names
  description = "Nomes das subnets (modulo)"
}
