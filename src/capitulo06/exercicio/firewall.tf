resource "google_compute_firewall" "fw-rule" {
  name    = "fw-rule-22"
  network = "vpcex"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
