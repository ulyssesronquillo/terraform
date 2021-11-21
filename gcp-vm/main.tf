provider "google" {
	project = "airy-totality-151318" 
	zone = "us-central1-c"
}

resource "google_compute_instance" "test-server" {
	name = "test-application-server"
	machine_type ="e2-micro"

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-9"
		}
	}

	network_interface {
		network = "default"
	}
}
