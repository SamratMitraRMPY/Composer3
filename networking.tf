resource "google_compute_network" "composer_vpc" {
  name                    = "composer3-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "composer_subnet" {
  name          = "composer3-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.composer_vpc.id
}