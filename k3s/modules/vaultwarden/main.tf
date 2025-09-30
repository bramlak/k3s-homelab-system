resource "kubernetes_namespace" "vaultwarden" {
  metadata {
    name = var.namespace
  }
}
