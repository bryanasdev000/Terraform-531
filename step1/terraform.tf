terraform {
  backend "gcs" {
    bucket = "backendgcs"
    prefix = "terraform/prod"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.79.0"
    }
  }
}

provider "google" {
  # Configuration options
}
