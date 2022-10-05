variable "project" {

}

variable "credentials_file" {

}

variable "database_user_password" {}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-d"
}

variable "gcp_service_list" {
  description = "A list of the necessary apis needed for the project"
  type        = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "sqladmin.googleapis.com"
  ]
}
