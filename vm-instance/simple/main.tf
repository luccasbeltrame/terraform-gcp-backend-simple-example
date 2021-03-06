resource "google_compute_instance" "main" {
  name         = var.instance_name
  machine_type = var.instance_machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    subnetwork = var.subnet_name
    access_config {
    }
  }

  service_account {
    scopes = ["storage-rw"]
  }

  allow_stopping_for_update = true
}

output "External_IP" {
  value = "${google_compute_instance.main.network_interface.0.access_config.0.nat_ip}"
}