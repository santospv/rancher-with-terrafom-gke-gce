resource "google_container_cluster" "cluster-gcp" {
  name     = sensitive("${var.project_id}-gke")
  location = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  network    = google_compute_network.terraform-network.name
  subnetwork = google_compute_subnetwork.subnet.name
  master_auth {
    username = var.gke_username
    password = var.gke_password
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "nodes_primarios" {
  name       = "${google_container_cluster.cluster-gcp.name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.cluster-gcp.name
  node_count = var.gke_num_nodes
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    labels = {
      env = sensitive(var.project_id)
    }
    machine_type = "e2-medium"
    disk_size_gb = "40"
    tags         = ["gke-node", sensitive("${var.project_id}-gke")]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}