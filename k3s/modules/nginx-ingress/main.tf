
resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    name = "nginx-ingress"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.nginx_ingress.metadata[0].name
}



resource "kubernetes_ingress_v1" "vaultwarden" {
  metadata {
    name      = "vaultwarden"
    namespace  = var.vaultwarden_namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"
    tls {
      hosts      = ["vaultwarden.local"]
      secret_name = "vaultwarden-tls"
    }

    rule {
      host = var.ingress_host_name
      http {
        path {
          path     = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "vaultwarden"
              port {
                number = var.vaultwarden_service_port
              }
            }
          }
        }
      }
    }
  }
}


resource "kubernetes_ingress_v1" "syncthing" {
  metadata {
    name      = "syncthing"
    namespace = var.syncthing_namespace
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "syncthing.${var.ingress_host_name}"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "syncthing"
              port {
                number = var.syncthing_service_port
              }
            }
          }
        }
      }
    }
  }
}