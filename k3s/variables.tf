variable "admin_token" {
  type        = string
  sensitive   = true
  description = "Vaultwarden admin token"
}


variable "tls_crt" {
  description = "TLS certificate for Vaultwarden (contents of tls.crt)"
  type        = string
  sensitive   = true
}

variable "tls_key" {
  description = "TLS private key for Vaultwarden (contents of tls.key)"
  type        = string
  sensitive   = true
}

variable "ingress_host_name" {
  description = "Hostname for the Ingress controller"
  type        = string
}

variable "grafana_admin_password" {
  type = string
  sensitive = true
  description = "grafana admin password"
}