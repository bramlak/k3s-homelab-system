variable "namespace" {
  description = "Kubernetes namespace for Syncthing"
  type        = string
  default     = "syncthing"
}

variable "replicas" {
  description = "Number of Syncthing replicas"
  type        = number
  default     = 1
}

variable "image_version" {
  description = "Syncthing container image version"
  type        = string
  default     = "2.0.10"
}

variable "ingress_port" {
  description = "Port for Syncthing ingress"
  type        = number
  default     = 80
}

variable "cpu_request" {
  description = "CPU request for Syncthing container"
  type        = string
  default     = "100m"
}

variable "cpu_limit" {
  description = "CPU limit for Syncthing container"
  type        = string
  default     = "500m"
}

variable "memory_request" {
  description = "Memory request for Syncthing container"
  type        = string
  default     = "256Mi"
}

variable "memory_limit" {
  description = "Memory limit for Syncthing container"
  type        = string
  default     = "512Mi"
}

variable "storage_size" {
  description = "Storage size"
  type = string
  default = "1Gi"
}

variable "service_port" {
  description = "Service port for Syncthing"
  type        = number
  default     = 80
}