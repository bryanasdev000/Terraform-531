#output "ip_externo" {
#  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
#  description = "IP externo da VM"
#}
#
#output "ip_interno" {
#  value = google_compute_instance.vm.network_interface.0.network_ip
#  description = "IP interno da VM"
#}
#
#output "size_disk" {
#  value = google_compute_disk.disco.size
#}
