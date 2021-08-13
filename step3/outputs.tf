output "ip_externo" {
  value = google_compute_instance.web[*].network_interface.0.access_config.0.nat_ip
  description = "IP externo da VM"
  #sensitive = true
}

output "id" {
  value = google_compute_instance.web[*].id
  description = "ID da VM"
}

output "ip_interno" {
  value = google_compute_instance.web[*].network_interface.0.network_ip
}

output "cpu_vm" {
  value = google_compute_instance.web[*].cpu_platform
}
