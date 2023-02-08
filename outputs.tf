 output "region" {
   value       = var.region
   description = "Região do Provisionamento"
   sensitive   = false
 }
 output "zone" {
  value = var.zone
  description = "Zona do Provisionamento"
  sensitive   = false
}
 output "project_id" {
   value       = var.project_id
   description = "ID do projeto GCP"
   sensitive   = false
 }
 output "user_rancher_host" {
   value       = var.user
   description = "Usuario SSH do Rancher Host"
   sensitive   = false
 }
 output "host_rancher" {
   value       = google_compute_address.static.address
   description = "IP Rancher Host"
   sensitive   = false
 }

  output "ssh_access" {
   value       = "ssh ${var.user}@${google_compute_address.static.address}" 
   description = "IP Rancher Host"
   sensitive   = false
 }