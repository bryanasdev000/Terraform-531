resource "google_storage_bucket" "state" {
  name          = "4linuxstateterraform"
  location      = "US"
  force_destroy = true
  versioning {
    enabled = true
  }
}
