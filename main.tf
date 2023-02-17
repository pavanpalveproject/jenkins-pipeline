terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  credentials = file("/path/to/service-account-key.json")
  project     = "o-media-practice"
  region      = "asia-south1"
}


resource "google_compute_instance" "my-cicd-vm" {
  name         = "cicd-vms"
  machine_type = "e2-small"
  project = "o-media-practice"
  zone     = "asia-south1-a"

 

  tags = ["allow-firewall"]

 

  

 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

 

  network_interface {
    network = "default"

 

  }
  allow_stopping_for_update = true
}