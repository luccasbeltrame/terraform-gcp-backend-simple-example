terraform {
  required_version = ">=0.12.6"
}
// Configure the Google Cloud provider
provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}