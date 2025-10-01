output "namespace" {
  description = "Kubernetes namespace for Syncthing"
  value       = kubernetes_namespace.syncthing.metadata[0].name
}

output "service_port" {
  value = var.service_port
  description = "Service port of the Vaultwarden deployment"
}