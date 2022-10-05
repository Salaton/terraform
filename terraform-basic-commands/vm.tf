# This will create a virtual machine on GCP

resource "google_compute_instance" "default" {
  name                      = "terraform-introduction"
  zone                      = "europe-west1-d"
  machine_type              = "n1-standard-1"
  tags                      = ["http-server", "https-server"]
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
      #   type - SSD
      type = "pd-ssd"
    }
    auto_delete = true
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      # Without any arguments here, this will give the VM an external IP address
    }
  }

  # Wait for the API to be enabled
  depends_on = [
    google_project_service.enable_gcp_services
  ]
}
