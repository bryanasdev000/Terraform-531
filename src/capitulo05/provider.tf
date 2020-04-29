provider "google" {
  project     = "project-id"
  credentials = file("/path/para/arquivo")
  region      = "southamerica-east-1"
}
