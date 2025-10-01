output "service_url" {
  value       = "http://${kubernetes_service.vaultwarden.metadata[0].name}.${var.namespace}.svc.cluster.local:${var.service_port}"
  description = "Vaultwarden service URL within the cluster"
}

output "namespace" {
  value       = kubernetes_namespace.vaultwarden.metadata[0].name
  description = "Vaultwarden namespace"
}