provider "google" {
  project = "airy-totality-151318"
  region  = "us-central1"
  zone    = "us-central1-a"
}
resource "google_compute_instance" "wiki" {
  name         = "wiki"
  machine_type = "n2-standard-1"
  zone         = "us-central1-a"
  tags         = ["web-server"]
  labels = {
    name        = "wiki"
    environment = "development"
  }
  boot_disk {
    initialize_params {
      image = "centos-7-v20210122"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  service_account {
    email  = "300067128312-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
