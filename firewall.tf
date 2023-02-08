resource "google_compute_firewall" "firewall" {
  name    = "externalssh"
  network = google_compute_network.terraform-network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}

resource "google_compute_firewall" "webserver" {
  name    = "webserver"
  network = google_compute_network.terraform-network.name

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver"]
}