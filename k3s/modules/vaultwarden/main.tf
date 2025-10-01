resource "kubernetes_namespace" "vaultwarden" {
  metadata {
    name = var.namespace
  }
}


resource "kubernetes_persistent_volume_claim" "vaultwarden" {
  metadata {
    name      = "vaultwarden-pvc"
    namespace = kubernetes_namespace.vaultwarden.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }

    storage_class_name = "manual"
    volume_name        = kubernetes_persistent_volume.vaultwarden.metadata[0].name
  }

}