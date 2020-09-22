resource "google_compute_disk" "ssd" {
  name  = format("%s-%s",var.nomessd,count.index)
  count = local.qtd
  type  = "pd-ssd"
  zone = google_compute_instance.vm[count.index].zone
}

resource "google_compute_attached_disk" "att" {
  count = local.qtd
  disk     = google_compute_disk.ssd[count.index].id
  instance = google_compute_instance.vm[count.index].id
}

