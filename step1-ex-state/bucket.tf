resource "google_storage_bucket" "backend" {
  name          = "backendtfex"
  location      = "US"
  force_destroy = false

  versioning {
    enabled = true
  }

}
