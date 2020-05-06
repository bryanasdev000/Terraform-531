output vm_id {
  value = google_compute_instance.vm.instance_id
  description = "Instance id da vm"
}

output vm_selflink {
  value = google_compute_instance.vm.self_link
  description = "self_link da vm"
}

output vm_external_ip {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
  description = "ip externo da primeira interface"
}


