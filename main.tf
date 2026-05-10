resource "google_composer_environment" "composer3" {

  provider = google-beta

  name    = var.environment_name
  region  = var.region
  project = var.project_id

  config {

    software_config {

      image_version = "composer-3-airflow-3"

      env_variables = {
        ENVIRONMENT = "sandbox"
      }

      pypi_packages = {
        
        pymssql     = "==2.3.2"
        pandas      = "==2.2.3"
      }
    }

    node_config {
      network         = google_compute_network.composer_vpc.id
      subnetwork      = google_compute_subnetwork.composer_subnet.id
      service_account = google_service_account.composer_sa.email
    }

   


    workloads_config {

      scheduler {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 5
        count      = 2
      }

      web_server {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 5
      }

      worker {
        cpu        = 2
        memory_gb  = 4
        storage_gb = 10
        min_count  = 1
        max_count  = 3
      }
    }
  }
} 
   