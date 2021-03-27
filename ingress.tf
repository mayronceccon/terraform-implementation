resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "ingress"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name

    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/${var.prefix}-terraform"
          
          backend {
            service_name = kubernetes_service.service.metadata.0.name
            service_port = var.container_port
          }
        }
      }
    }
  }
}