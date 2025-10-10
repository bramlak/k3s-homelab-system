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



resource "kubernetes_deployment" "grafana" {
  metadata {
    name      = "grafana"
    namespace = kubernetes_namespace.grafana.metadata[0].name
    labels = {
      app = "grafana"
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        container {
          name  = "grafana"
          image = "grafana/grafana:${var.image_version}"

          volume_mount {
            name       = "grafana-data"
            mount_path = "/var/lib/grafana"
          }

          port {
            container_port = 3000
          }

          env {
            name  = "GF_SECURITY_ADMIN_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.grafana_admin.metadata[0].name
                key  = "admin_password"
              }
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
              path = "/api/health"
              port = 3000
            }
            initial_delay_seconds = 15
            period_seconds        = 10
          }
        }

        volume {
          name = "grafana-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.grafana.metadata[0].name
          }
        }
      }
    }
  }
}
