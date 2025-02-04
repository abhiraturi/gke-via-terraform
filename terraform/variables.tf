variable project_id {
    description = "gcp project ID"
    type = string
    default = "gcp-project-449820"
}

variable "region" {
    description = "GCP region to be deployed at"
    type = string
    default = "us-central1"
}

variable "zone" {
    description = "zone"
    type = string
    default = "us-central1-a"
}

variable "cluster_name" {
  description = "cluster name"
  type = string
  default = "my-gke-cluster"
}


variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "GCP machine type for node pool"
  type        = string
  default     = "e2-medium"
}

variable "account_id" {
    description = "account id"
    type = string
    default = "gcp-project-449820"
}

variable "account_email" {
    description = "google account email"
    type = string
    default = "terraform-sa@gcp-project-449820.iam.gserviceaccount.com"
  
}