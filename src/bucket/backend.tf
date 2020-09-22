terraform {
  backend "gcs" {
    bucket  = "curso-terraform-bucket-gcs"
    prefix  = "terraform/"
  }
}
