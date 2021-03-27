resource "kubernetes_namespace" "namespace-terraform" {
    metadata {
      name = "${var.prefix}-namespace-terraform"
    }
}