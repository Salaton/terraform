# Provider --> Plugin that allows us to talk to a specific set of APIs
# Terraform uses it to create and manage your resources.
# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "3.5.0"
#     }
#   }
# }

# This block configures the specified provider
provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

# Resource blocks defines the components of your infrastructure. It might be a component like a server. 
# It defines the resource type and the resource name before the beginning of the block
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
