resource "google_compute_network" "terraform-network" {
  name                    = sensitive("${var.project_id}-vpcrancher")
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}
resource "google_compute_subnetwork" "public_subnet" {
  name          = sensitive("${var.project_id}-public-subnet")
  ip_cidr_range = var.uc1_public_subnet
  network       = google_compute_network.terraform-network.name
  region        = var.region
}
resource "google_compute_subnetwork" "private_subnet" {
  name          = sensitive("${var.project_id}-private-subnet")
  ip_cidr_range = var.uc1_private_subnet
  network       = google_compute_network.terraform-network.name
  region        = var.region
}

# resource "google_compute_router" "router" {
#   name    = "my-router"
#   region  = google_compute_subnetwork.subnet.region
#   network = google_compute_network.terraform-network.name
# }
# resource "google_compute_address" "static" {
#   name = "ipv4-address2"
#   region = google_compute_subnetwork.subnet.region
# }

# resource "google_compute_router_nat" "nat_rules" {
#   name   = "my-router-nat"
#   router = google_compute_router.router.name
#   region = google_compute_router.router.region

#   nat_ip_allocate_option = "MANUAL_ONLY"
#   nat_ips                = [google_compute_address.static.self_link]

#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
#   subnetwork {
#     name                    = google_compute_subnetwork.subnet.id
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }

#   enable_endpoint_independent_mapping = false
# }