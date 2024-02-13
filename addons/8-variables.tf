variable "eks_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "prometheus_chart_version" {
  description = "Version of the Prometheus Helm chart."
  type        = string
}

variable "grafana_chart_version" {
  description = "Version of the Grafana Helm chart."
  type        = string
}


variable "monitoring_namespace" {
  description = "Kubernetes namespace for monitoring tools."
  type        = string
  default     = "monitoring"
}


variable "grafana_admin_password" {
  description = "Admin password for Grafana."
  type        = string
}

variable "grafana_url" {
  description = "the service URL"
  type        = string
}

variable "env" {
  description = "The environment for the deployment"
  type        = string
}

