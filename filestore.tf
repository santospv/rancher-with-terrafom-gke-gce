resource "google_filestore_instance" "filestore_terraform" {
  name = "dados-nfs"
  zone = var.zone
  tier = "BASIC_HDD"

  file_shares {
    capacity_gb = 1024
    name        = "arquivos"
  }

  networks {
    network = google_compute_network.terraform-network.name
    modes   = ["MODE_IPV4"]
  }
}