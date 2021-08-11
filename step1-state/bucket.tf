resource "google_storage_bucket" "backend" {
  name          = "backendgcs"
  location      = "US"
  force_destroy = false

  versioning {
    enabled = true
  }

}
