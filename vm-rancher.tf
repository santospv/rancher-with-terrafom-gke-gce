resource "google_compute_address" "static" {
  name = "ipv4-address2"
}
resource "google_compute_instance" "rancher_host" {
  name = sensitive("${var.project_id}-rancher")
  project = var.project_id
  machine_type = "e2-medium"
  zone = var.zone
  tags = ["gce", sensitive("${var.project_id}-rancher")]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = "15"
    }
  }
  network_interface {
    network = google_compute_network.terraform-network.name
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  metadata = {
    ssh-keys = "${var.user}:${file(var.publickeypath)}"
  }
  service_account {
    email  = var.email
    scopes = ["compute-ro"]
  }

}
