variable "enable_argo_cd" {
  description = "Determines whether to deploy Argo CD"
  type        = bool
  default     = false
}

variable "argo_cd_helm_version" {
  description = "Argo CD Helm chart version"
  type        = string
}

variable "argo_cd_namespace" {
  description = "The namespace where Argo CD will be installed"
  default     = "argocd"
  type        = string
}

variable "argo_cd_ingress_host" {
  description = "Hostname for Argo CD server ingress"
  type        = string
}

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

variable "karpenter_chart_version" {
  description = "Version of the Karpenter Helm chart."
  type        = string
}

variable "monitoring_namespace" {
  description = "Kubernetes namespace for monitoring tools."
  type        = string
  default     = "monitoring"
}

variable "karpenter_namespace" {
  description = "Kubernetes namespace for Karpenter."
  type        = string
  default     = "karpenter"
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana."
  type        = string
}


