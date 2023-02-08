resource "google_compute_network" "terraform-network" {
  name                    = sensitive("${var.project_id}-vpcrancher")
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
resource "google_compute_subnetwork" "public_subnet" {
  name          = sensitive("${var.project_id}-public-subnet")
  ip_cidr_range = var.public_subnet
  network       = google_compute_network.terraform-network.name
  region        = var.region
}
resource "google_compute_subnetwork" "private_subnet" {
  name          = sensitive("${var.project_id}-private-subnet")
  ip_cidr_range = var.private_subnet
  network       = google_compute_network.terraform-network.name
  region        = var.region
}