terraform {
  backend "gcs" {
    bucket = "samrats-sandbox-tfstate"
    prefix = "composer3/sandbox"
  }
}