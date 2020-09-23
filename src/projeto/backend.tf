terraform {
  backend "gcs" {
    bucket = "terrastates-curso"
    prefix = "terraform/state"
  }
}
