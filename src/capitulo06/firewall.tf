resource "google_compute_firewall" "fw-rule" {
  name    = "fw-rule-22"
  network = google_compute_network.vpc0.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
