
terraform {
    required_providers {
        google  = {
            source  = "hashicorp/google"
            version = "3.52.0"
        }
    } 

    backend "gcs" {
        bucket  = "terraform_bucket_pvs"
        prefix  = "terraform/terraform.tfstate"
        credentials  = "serviceaccount.json"
    }
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials  = "${file("serviceaccount.json")}"
}