variable "namespace" {
  description = "Kubernetes namespace for Vaultwarden"
  type        = string
  default     = "vaultwarden"
}

variable "image_version" {
  description = "Vaultwarden image version"
  type        = string
  default     = "1.30.1"
}

variable "replicas" {
  description = "Number of Vaultwarden replicas"
  type        = number
  default     = 1
}

variable "admin_token" {
  description = "Admin token for Vaultwarden"
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

variable "cpu_request" {
  description = "CPU request for Vaultwarden container"
  type        = string
  default     = "100m"
}

variable "memory_request" {
  description = "Memory request for Vaultwarden container"
  type        = string
  default     = "256Mi"
}

variable "cpu_limit" {
  description = "CPU limit for Vaultwarden container"
  type        = string
  default     = "500m"
}

variable "memory_limit" {
  description = "Memory limit for Vaultwarden container"
  type        = string
  default     = "512Mi"
}

variable "service_port" {
  description = "Service port for Vaultwarden"
  type        = number
  default     = 80
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