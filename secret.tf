resource "kubernetes_secret" "secret" {
  metadata {
    name = "secret"
    namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
  }
  type = "Opaque"

  data = {
    "KEY_SECRET" = "Minha Secret v2"
  }
}