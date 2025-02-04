provider "google" {
    credentials = file("terraform-sa.json")
    project = var.project_id
    region = var.region
}


resource "google_container_cluster" "gke_cluster" {
  name = var.cluster_name
  location = var.zone
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}