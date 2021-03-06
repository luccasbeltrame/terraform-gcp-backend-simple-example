terraform {
  required_version = ">= 0.12"
}
provider "google" {
  version = "~> 2.0"
  credentials = file(var.gcp_auth_file)
  project     = var.gcp_project
  region      = var.gcp_region
}