terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/k3s-homelab/config"
}


module "vaultwarden" {
  source = "../modules/vultwarden"
}
