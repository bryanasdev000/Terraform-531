output "ip_externo_vm" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
  description = "IP externo da VM"
}

output "ip_interno_vm" {
  value = google_compute_instance.default.network_interface.0.network_ip
  description = "IP interno da VM"
} 

output "size_disk" {
  value = google_compute_disk.default.size
  description = "Tamanho do disco externo"
}

output "link_vm" {
  value = google_compute_instance.default.self_link
  description = "self_link da VM"
}

output "link_disk" {
  value = google_compute_disk.default.self_link
  description = "self_link do disco"
}
