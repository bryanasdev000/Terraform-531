terraform {
  backend "gcs" {
    bucket  = "curso-terraform-gcp"
    prefix  = "curso/terraform/"
  }
}
