output ip_instancia {
  value = google_compute_instance.vm0.network_interface.0.access_config.0.nat_ip
  description = "IP externo da interface 1"
}

output id_instancia {
  value = google_compute_instance.vm0.instance_id
  description = "ID da instancia"
}

output full {
  value = google_compute_instance.vm0
  description = "JSON Full"
}
