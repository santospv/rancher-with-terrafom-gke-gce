output "region" {
  value       = var.region
  description = "Região do GCloud"
  sensitive   = false
}

output "project_id" {
  value       = var.project_id
  description = "ID do projeto GCP"
  sensitive   = false
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.cluster-gcp.name
  description = "Nome do cluster GKE"
  sensitive   = true
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.cluster-gcp.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}

output "filestore_terraform_zone" {
  value       = google_filestore_instance.filestore_terraform.zone
  description = "Zone filestore"
  sensitive   = false
}

output "filestore_terraform_name" {
  value       = google_filestore_instance.filestore_terraform.name
  description = "Name filestore"
  sensitive   = false
}
output "filestore_terraform" {
  value       = join(" ", tolist(google_filestore_instance.filestore_terraform.networks[0].ip_addresses))
  description = "IP filestore"
  sensitive   = false
}
