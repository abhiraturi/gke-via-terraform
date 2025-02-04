output "gke_cluster_name" {
  description = "The name of the created GKE cluster"
  value       = google_container_cluster.gke_cluster.name
}

output "gke_cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = google_container_cluster.gke_cluster.endpoint
}

# output "flask_service_ip" {
#   description = "External IP of the Flask app service"
#   value       = kubernetes_service.flask_service.status[0].load_balancer[0].ingress[0].ip
# }
