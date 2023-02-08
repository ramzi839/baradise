terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
      
    }
  }
}


provider "google" {
  project = "elastic-trino"
  region  = "us-west1"
  zone    = "us-west1-a"
  //credentials = "../keys.json"

}


