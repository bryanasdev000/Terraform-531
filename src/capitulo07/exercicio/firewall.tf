resource "google_compute_firewall" "fw-rule" {
  name    = "allow-basic-ports"
  network = google_compute_network.vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "3389"]
  }
  
  allow {
    protocol = "udp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
}
