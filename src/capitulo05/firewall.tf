resource "google_compute_firewall" "fw-rule" {
  name    = "fw-rule-22"
  network = "vpc0"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
