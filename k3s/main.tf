terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

module "nginx_ingress" {
  source                   = "./modules/nginx-ingress"
  vaultwarden_namespace    = module.vaultwarden.namespace
  vaultwarden_service_port = module.vaultwarden.service_port
  syncthing_namespace      = module.syncthing.namespace
  syncthing_service_port   = module.syncthing.service_port
  ingress_host_name        = var.ingress_host_name
}

module "vaultwarden" {
  source            = "./modules/vaultwarden"
  admin_token       = var.admin_token
  ingress_host_name = var.ingress_host_name
  tls_crt           = var.tls_crt
  tls_key           = var.tls_key
}

module "syncthing" {
  source            = "./modules/syncthing"
  ingress_host_name = var.ingress_host_name
}
