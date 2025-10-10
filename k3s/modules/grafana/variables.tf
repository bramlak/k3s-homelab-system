variable "namespace" {
  description = "Kubernetes namespace for Grafana"
  type        = string
  default     = "grafana"
}

variable "image_version" {
  description = "Grafana image version"
  type        = string
  default     = "latest"
}

variable "replicas" {
  description = "Number of Grafana replicas"
  type        = number
  default     = 1
}

variable "admin_password" {
  description = "Admin password for Grafana"
  type        = string
  sensitive   = true
}

variable "ingress_port" {
  description = "Port for the Ingress controller"
  type        = number
  default     = 30080
}

variable "cpu_request" {
  description = "CPU request for Grafana container"
  type        = string
  default     = "100m"
}

variable "memory_request" {
  description = "Memory request for Grafana container"
  type        = string
  default     = "256Mi"
}

variable "cpu_limit" {
  description = "CPU limit for Grafana container"
  type        = string
  default     = "500m"
}

variable "memory_limit" {
  description = "Memory limit for Grafana container"
  type        = string
  default     = "512Mi"
}

variable "ingress_host_name" {
  description = "Hostname for the Ingress controller"
  type        = string
}

variable "service_port" {
  description = "Service port for Grafana"
  type        = number
  default     = 3000
}