variable "namespace" {
  type        = string
  default     = "vaultwarden"
  description = "Kubernetes namespace for Vaultwarden"
}

variable "image_version" {
  type        = string
  default     = "latest"
  description = "Vaultwarden Docker image version"
}

variable "replicas" {
  type        = number
  default     = 1
  description = "Number of Vaultwarden replicas"
}

variable "admin_token" {
  type        = string
  sensitive   = true
  description = "Vaultwarden admin token"
}

variable "service_port" {
  type        = number
  default     = 80
  description = "Vaultwarden service port"
}

variable "cpu_request" {
  type        = string
  default     = "50m"
  description = "CPU request for Vaultwarden container"
}

variable "memory_request" {
  type        = string
  default     = "64Mi"
  description = "Memory request for Vaultwarden container"
}

variable "cpu_limit" {
  type        = string
  default     = "100m"
  description = "CPU limit for Vaultwarden container"
}

variable "memory_limit" {
  type        = string
  default     = "100Mi"
  description = "Memory limit for Vaultwarden container"
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

variable "ingress_port" {
  description = "Port for the Ingress controller"
  type        = number
  default     = 30080
}

variable "ingress_host" {
  description = "Hostname for the Ingress controller"
  type        = string
  default     = "cirrus"
}