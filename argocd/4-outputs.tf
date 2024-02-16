output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster API."
  value       = data.aws_eks_cluster.eks.endpoint
}

output "eks_cluster_ca_certificate" {
  description = "The base64 decoded cluster CA certificate for the EKS cluster."
  value       = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
}

output "eks_access_token" {
  description = "The token for authenticating against the EKS cluster."
  value       = data.aws_eks_cluster_auth.eks.token
}
