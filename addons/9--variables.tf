variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

variable "env" {
  description = "Environment name."
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

variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
}

variable "openid_provider_arn" {
  description = "IAM Openid Connect Provider ARN"
  type        = string
}

