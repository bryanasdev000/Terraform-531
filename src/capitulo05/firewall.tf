resource "google_compute_firewall" "fw-rule" {
  name    = "fw-rule-8080"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}