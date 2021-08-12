terraform {
  backend "gcs" {
    bucket = "backendtfex"
    prefix = "terraform/"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.79.0"
    }
  }
}

provider "google" {
}
