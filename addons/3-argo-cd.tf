resource "helm_release" "argo_cd" {
  depends_on = [kubernetes_namespace.argocd]
  count = var.enable_argo_cd ? 1 : 0

  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argo_cd_helm_version
  namespace  = var.argo_cd_namespace

  set {
    name  = "server.service.type"
    value = "LoadBalancer" 
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = var.argo_cd_ingress_host
  }

  
}
