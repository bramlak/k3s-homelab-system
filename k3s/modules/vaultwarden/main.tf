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




resource "kubernetes_deployment" "vaultwarden" {
  metadata {
    name      = "vaultwarden"
    namespace = kubernetes_namespace.vaultwarden.metadata[0].name
    labels = {
      app = "vaultwarden"
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "vaultwarden"
      }
    }

    template {
      metadata {
        labels = {
          app = "vaultwarden"
        }
      }

      spec {
        container {
          name  = "vaultwarden"
          image = "vaultwarden/server:${var.image_version}"

          volume_mount {
            name = "vaultwarden-data"
            mount_path = "/data"
          }

          port {
            container_port = 80
          }

          env {
            name  = "ADMIN_TOKEN"
            value = var.admin_token
          }

          env {
            name  = "WEBSOCKET_ENABLED"
            value = "true"
          }

          env {
            name  = "DOMAIN"
            value = "https://${var.ingress_host_name}:${var.ingress_port}"
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
              path = "/alive"
              port = 80
            }
            initial_delay_seconds = 15
            period_seconds        = 10
          }
        }
        volume {
          name = "vaultwarden-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.vaultwarden.metadata[0].name
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "vaultwarden" {
  metadata {
    name      = "vaultwarden"
    namespace = kubernetes_namespace.vaultwarden.metadata[0].name
  }

  spec {
    selector = {
      app = "vaultwarden"
    }

    port {
      port        = var.service_port
      target_port = 80
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_secret" "vaultwarden_tls" {
  metadata {
    name      = "vaultwarden-tls"
    namespace = kubernetes_namespace.vaultwarden.metadata[0].name
  }
  data = {
    "tls.crt" = base64encode(var.tls_crt)
    "tls.key" = base64encode(var.tls_key)
  }
  type = "kubernetes.io/tls"
}