resource "kubernetes_namespace" "syncthing" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_persistent_volume" "syncthing" {
  metadata {
    name = "syncthing-pv"
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
        path = "/mnt/syncthing-data"
        type = "DirectoryOrCreate"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "syncthing" {
  metadata {
    name      = "syncthing-pvc"
    namespace = kubernetes_namespace.syncthing.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage_size
      }
    }
    storage_class_name = "manual"
    volume_name        = kubernetes_persistent_volume.syncthing.metadata[0].name
  }
}
