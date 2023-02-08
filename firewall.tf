resource "google_compute_firewall" "webserver" {
  name    = "webserver"
  network = google_compute_network.terraform-network.name

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
}
resource "google_compute_firewall" "hostrancher" {
  name    = "ssh-access"
  network = google_compute_network.terraform-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "rancherinternal" {
  name    = "ssh-access-internal"
  network = google_compute_network.terraform-network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["172.16.1.0/24"]
}

