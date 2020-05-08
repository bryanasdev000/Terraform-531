terraform {
  backend "gcs" {
    bucket = "terrastates"
    prefix = "terraform/state"
  }
}
