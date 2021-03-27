resource "kubernetes_horizontal_pod_autoscaler" "hpa" {
  metadata {
    name = "hpa"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind = "Deployment"
      name = kubernetes_deployment.deployment.metadata.0.name
    }

    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type = "Utilization"
          average_utilization = var.cpu_average_utilization
        }
      }
    }
  }
}