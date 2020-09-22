output "ip_das_vms" { 
  value = google_compute_instance.vm[*].network_interface.0.access_config.0.nat_ip 
  description = "Endereco IP externo das vms"
}
output "ip_da_1vm" { 
  value = google_compute_instance.vm[0].network_interface.0.access_config.0.nat_ip 
  description = "Endereco IP externo das vms"
}
output "id" { 
  value = google_compute_instance.vm[*].instance_id
}
output "link" { 
  value = google_compute_instance.vm[*].self_link
}
output "fingerprint" { 
  value = google_compute_instance.vm[*].tags_fingerprint
}
output "cpu" { 
  value = google_compute_instance.vm[*].cpu_platform
}


