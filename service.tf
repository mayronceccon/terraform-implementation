resource "kubernetes_service" "service" {
  metadata {
    name = "service"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
  }

  spec {
    type = "NodePort"

    port {
      port = var.container_port
    }

    selector = {
      app = kubernetes_deployment.deployment.metadata.0.labels.app
    }
  }
}