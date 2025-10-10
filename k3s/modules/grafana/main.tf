resource "kubernetes_namespace" "grafana" {
  metadata {
    name = var.namespace
  }
}


resource "kubernetes_persistent_volume_claim" "grafana" {
  metadata {
    name      = "grafana-pvc"
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }

    storage_class_name = "manual"
    volume_name        = kubernetes_persistent_volume.grafana.metadata[0].name
  }
}



resource "kubernetes_persistent_volume" "grafana" {
  metadata {
    name = "grafana-pv"
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
        path = "/mnt/grafana-data"
        type = "DirectoryOrCreate"
      }
    }
  }

}
