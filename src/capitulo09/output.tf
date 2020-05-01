output "ip_instancia" {
  description = "IP da primeira interface da rede da instancia"
  value = google_compute_instance.vm0.network_interface.0.network_ip
}

output "cpu" {
  description = "CPU utlizada na maquina"
  value = google_compute_instance.vm0.cpu_platform
}

