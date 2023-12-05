terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.7.0"
    }
  }
}

provider "google" {
  credentials = file("~/Documentos/key.json")
  project = var.project_id
}