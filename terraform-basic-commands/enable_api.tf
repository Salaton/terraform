# This file will be used to create resources that enable the various APIs in the
# GCP ecosystem
resource "google_project_service" "enable_gcp_services" {
  for_each = toset(var.gcp_service_list)
  project  = var.project
  service  = each.key #or each.value.default
}
