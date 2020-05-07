resource "google_compute_instance" "import" {
  name         = "import"
  zone         = "us-central1-a"
  machine_type = "f1-micro"
}
