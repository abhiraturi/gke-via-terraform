provider "kubernetes" {
  config_path = "~/.kube/config"  # Optional, specify the path if it's not default
  # Or, set KUBECONFIG environment variable as above
}
resource "kubernetes_deployment" "app" {
  metadata {
    name = "flask-app"
    labels = {
      app = "flask-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "flask-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }

      spec {
        container {
          image = "gcr.io/${var.project_id}/flask-app:latest"
          name  = "flask-app"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_service" {
  metadata {
    name = "flask-service"
  }

  spec {
    selector = {
      app = "flask-app"
    }

    port {
      protocol   = "TCP"
      port       = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
