output "modulo_vpc_self_link" {
  value       = module.modulo-rede-tf-chapter11-ex2.network_self_link
  description = "Self_link da VPC"
}

output "modulo_lb_ip" {
  value       = module.modulo-lb-tf-chapter11.external_ip
  description = "IP externo do LB"
}
