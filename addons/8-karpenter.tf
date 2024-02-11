resource "helm_release" "karpenter" {
  name       = "karpenter"
  repository = "https://charts.karpenter.sh"
  chart      = "karpenter"
  version    = var.karpenter_chart_version
  namespace  = var.karpenter_namespace

  set {
    name  = "clusterName"
    value = var.eks_name
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "arn:aws:iam::343568180534:role/KarpenterNodeRole" # Ensure this is dynamically set or managed appropriately
  }
}
