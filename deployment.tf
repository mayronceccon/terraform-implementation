resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "deployment"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
    labels = {
      app = "sistema"
    }
  }

  spec {
    replicas = var.replicas

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge = "25%"
        max_unavailable = "25%"
      }
    }
    
    selector {
      match_labels = {
        app = "sistema"
      }
    }

    template {
      metadata {
        labels = {
          app = "sistema"
        }
      }
      spec {
        container {
          name = "sistema"
          image = var.container_image
          image_pull_policy = "Always"
          port {
            container_port = var.container_port
          }
          env_from {
            config_map_ref {
              name = kubernetes_config_map.configmap.metadata.0.name
            }
          }
          env_from {
            secret_ref {
              name = kubernetes_secret.secret.metadata.0.name
            }
          }
          resources {
            requests {
              memory = var.request_memory
              cpu = var.request_cpu
            }
            limits {
              memory = var.limits_memory
              cpu = var.limits_cpu
            }
          }
          volume_mount {
            mount_path = "/usr/src/app/files"
            name = "csv-conf"
            read_only = true
          }
        }
        volume {
          name = "csv-conf"
          config_map {
            name = kubernetes_config_map.configmap.metadata.0.name
            items {
              key = "users.csv"
              path = "users.csv"
            }
          }
        }
      }
    }
  }
}