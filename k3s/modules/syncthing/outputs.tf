output "namespace" {
  description = "Kubernetes namespace for Syncthing"
  value       = kubernetes_namespace.syncthing.metadata[0].name
}