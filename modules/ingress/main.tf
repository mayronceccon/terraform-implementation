resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "${var.prefix}-ingress"
    namespace = var.namespace

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
            service_name = var.service_name
            service_port = var.container_port
          }
        }
      }
    }
  }
}