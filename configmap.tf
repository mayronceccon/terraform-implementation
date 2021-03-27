resource "kubernetes_config_map" "configmap" {
    metadata {
      name = "configmap"
      namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
    }

    data = {
      NODE_ENV = var.node_env
      PORT = var.container_port
      "users.csv" = file("${path.module}/users.csv")
    }
}