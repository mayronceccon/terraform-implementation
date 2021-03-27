module "ingress_module" {
  source = "./modules/ingress"
  
  namespace = kubernetes_namespace.namespace-terraform.metadata.0.name
  prefix = var.prefix
  service_name = kubernetes_service.service.metadata.0.name
  container_port = var.container_port
}