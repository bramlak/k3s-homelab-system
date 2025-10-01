output "service_url" {
  value       = "http://${kubernetes_service.vaultwarden.metadata[0].name}.${var.namespace}.svc.cluster.local:${var.service_port}"
  description = "Vaultwarden service URL within the cluster"
}

output "namespace" {
  value       = kubernetes_namespace.vaultwarden.metadata[0].name
  description = "Vaultwarden namespace"
}

output "vaultwarden_tls_secret_name" {
  value = kubernetes_secret.vaultwarden_tls.metadata[0].name
  description = "Name of the Vaultwarden TLS secret"
}

output "service_port" {
  value = var.service_port
  description = "Service port of the Vaultwarden deployment"
}