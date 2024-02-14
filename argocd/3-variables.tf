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