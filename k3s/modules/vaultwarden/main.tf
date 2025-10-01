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


resource "kubernetes_persistent_volume" "vaultwarden" {
  metadata {
    name = "vaultwarden-pv"
    labels = {
      type = "local"
    }
  }

  spec {
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "manual"
    persistent_volume_reclaim_policy = "Retain"

    persistent_volume_source {
      host_path {
        path = "/mnt/vaultwarden-data"
        type = "DirectoryOrCreate"
      }
    }
  }
}
