resource "google_project_service" "composer_api" {
  service = "composer.googleapis.com"
}

resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}