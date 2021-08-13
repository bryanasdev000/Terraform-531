#resource "google_compute_disk" "disco" {
#  name  = var.disk_name
#  type  = var.disk_type
#  zone  = google_compute_instance.vm.zone
#  size  = var.disk_size
#}
#
#resource "google_compute_attached_disk" "anexo" {
#  disk     = google_compute_disk.disco.id
#  instance = google_compute_instance.vm.id
#}
#
#
