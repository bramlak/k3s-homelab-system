terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

module "nginx_ingress" {
  source       = "./modules/nginx-ingress"
  vaultwarden_namespace = module.vaultwarden.namespace
}

module "vaultwarden" {
  source = "../modules/vultwarden"
  namespace      = var.namespace
  image_version  = var.image_version
  replicas       = var.replicas
  admin_token    = var.admin_token
  service_port   = var.service_port
  ingress_port   = var.ingress_port
  ingress_host   = var.ingress_host
  cpu_request    = var.cpu_request
  memory_request = var.memory_request
  cpu_limit      = var.cpu_limit
  memory_limit   = var.memory_limit
  tls_crt        = var.tls_crt
  tls_key        = var.tls_key
}
