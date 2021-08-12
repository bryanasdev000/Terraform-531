resource "google_compute_disk" "disco" {
  name  = format("%s-%s", terraform.workspace, "web-disco")
  type  = "pd-ssd"
  zone  = google_compute_instance.vm.zone
  size  = 10
}

resource "google_compute_attached_disk" "anexo" {
  disk     = google_compute_disk.disco.id
  instance = google_compute_instance.vm.id
}
