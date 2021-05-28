resource "google_storage_bucket" "state" {
  name          = "4linuxstateterraform"
  location      = "US"
  versioning {
    enabled = true
  }
}
