resource "google_storage_bucket" "bucket" {
  name          = "terrastates"
  location      = "SOUTHAMERICA-EAST1"
  versioning {
    enabled = true
  }
}
