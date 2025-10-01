variable "vaultwarden_namespace" {
  description = "vaultwarden namespace"
  type  = string
}

variable "vaultwarden_service_port" {
  description = "vaultwarden service port"
  type = number
}

variable "ingress_host_name" {
  description = "ingress host name"
  type = string
}