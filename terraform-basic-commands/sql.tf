resource "google_sql_database_instance" "testing-terraform-instance" {
  name             = "testing-terraform-instance"
  database_version = "POSTGRES_14"
  region           = var.region
  project          = var.project

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier      = "db-f1-micro"
    disk_size = 10
    disk_type = "PD_SSD"

    maintenance_window {
      day          = 6
      hour         = 0
      update_track = "stable"
    }
  }

  # Wait for the API to be enabled
  depends_on = [
    google_project_service.enable_gcp_services
  ]
}


# Create a database within the database instance
resource "google_sql_database" "testing-database" {
  name     = "testing-database"
  instance = google_sql_database_instance.testing-terraform-instance.name
}

# Create the database user
resource "google_sql_user" "database-user" {
  name     = "salaton"
  instance = google_sql_database_instance.testing-terraform-instance.name
  password = var.database_user_password
}
