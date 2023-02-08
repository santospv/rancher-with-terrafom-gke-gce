variable "project_id" {
  default     = "pvs-devops-iac-377117"
  description = "id do projeto"
}
variable "region" {
  default     = "us-south1"
  description = "região do projeto"
}
variable "zone" {
  default = "us-south1-c"
  description = "zone"
}
variable "privatekeypath" {
    type = string
    default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}
variable "email" {
    type = string
    default = "devops@pvs-devops-iac-377117.iam.gserviceaccount.com"
}
variable "user" {
    type = string
    default = "santospv"
}

