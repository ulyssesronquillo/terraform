provider "google" {
  project = "airy-totality-151318"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "test" {
  name         = "test"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
