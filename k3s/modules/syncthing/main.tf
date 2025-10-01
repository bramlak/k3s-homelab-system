resource "kubernetes_namespace" "syncthing" {
  metadata {
    name = var.namespace
  }
}