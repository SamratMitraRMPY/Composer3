resource "google_service_account" "composer_sa" {
  account_id   = "composer3-sa"
  display_name = "Composer 3 Service Account"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.project_id
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.composer_sa.email}"
}