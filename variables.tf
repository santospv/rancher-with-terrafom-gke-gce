variable "project_id" {
  default     = "pvs-devops-iac-377117"
  description = "id do projeto"
}

variable "region" {
  default     = "us-south1"
  description = "região do projeto"
}
variable "gke_username" {
  default     = ""
  description = "user do gke"
}

variable "gke_password" {
  default     = ""
  description = "password do gke"
}

variable "gke_num_nodes" {
  default     = 3
  description = "numero de nodes para o cluster"
}

variable "zone" {
  default = "us-south1-c"
  description = "zone"
}

