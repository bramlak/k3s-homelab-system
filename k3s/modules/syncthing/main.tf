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


resource "kubernetes_deployment" "syncthing" {
  metadata {
    name      = "syncthing"
    namespace = kubernetes_namespace.syncthing.metadata[0].name
    labels = {
      app = "syncthing"
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "syncthing"
      }
    }

    template {
      metadata {
        labels = {
          app = "syncthing"
        }
      }

      spec {
        container {
          name  = "syncthing"
          image = "syncthing/syncthing:${var.image_version}"

          volume_mount {
            name       = "syncthing-data"
            mount_path = "/var/syncthing"
          }

          port {
            container_port = 8384
          }
          port {
            container_port = 22000
          }
          port {
            container_port = 21027
            protocol      = "UDP"
          }

          env_from {
            secret_ref {
              name = kubernetes_secret.syncthing.metadata[0].name
            }
          }

          resources {
            requests = {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 8384
            }
            initial_delay_seconds = 30
            period_seconds        = 10
          }
        }

        volume {
          name = "syncthing-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.syncthing.metadata[0].name
          }
        }
      }
    }
  }
}

