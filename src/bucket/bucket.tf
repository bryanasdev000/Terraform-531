resource "google_storage_bucket" "this" {
  name          = "curso-terraform-bucket-gcs"
  location      = "US"
  force_destroy = true
  
}
