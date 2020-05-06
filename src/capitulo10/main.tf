#module "vpc-custom" {
#  source = "./vpc-exemplo"
#  nome_vpc = "rede-batatas"
#  desc_vpc = "Rede batatas padrao das minhas maquinas"
#}

module "gcp-instance" {
  source = "./gcp-instance"
}


output "modulo-vm-ip" {
  value = module.gcp-instance.vm_external_ip
  description = "IP da VM"
}
