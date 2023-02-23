terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# resource "google_secret_manager_secret_version" "credentials" {
#   provider = google-beta

#   secret = "projects/o-media-2/secrets/key-jenkins/versions/latest"
# }

# data "google_secret_manager_secret_version" "service_account_key" {
#   provider = google-beta

#   secret = "projects/o-media-2/secrets/key-jenkins"
# }

# data "google_secret_manager_secret_version" "key" {
#   provider = google-beta
#   secret   = "admin-username"
# }


provider "google" {
  # credentials = jsondecode(data.google_secret_manager_secret_version.service_account_key.payload_data)
  project     = "o-media-2"
  region      = "asia-south1"
}


resource "google_compute_instance" "my-cicd-vm" {
  name         = "cicd-vms"
  machine_type = "e2-small"
  project = "o-media-2"
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