terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.69.0"
    }
  }
  backend "gcs" {
    bucket  = "4linuxstateterraform"
    prefix  = "terraform/state"
  }
}

provider "google" {
}


