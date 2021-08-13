terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.79.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

  }
}

provider "google" {
}

provider "random" {
}
