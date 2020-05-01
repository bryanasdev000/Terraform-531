resource "google_compute_disk" "disk0" {
  name  = var.nome_disco
  type  = var.tipo_disco
  zone  = var.zona
  size  = var.tamanho
  physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "diskinstance0" {
  disk     = google_compute_disk.disk0.id
  instance = google_compute_instance.vm0.id
}
