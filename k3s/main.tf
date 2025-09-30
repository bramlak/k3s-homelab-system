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
}
