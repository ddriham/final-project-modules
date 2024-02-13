# data "kubernetes_service" "nginx_ingress" {
#   depends_on = [helm_release.nginx_ingress]
#   metadata { 
#   }
# }

resource "null_resource" "check_nginx_ready" {
  depends_on = [helm_release.nginx_ingress]

  provisioner "local-exec" {
    command = "until kubectl get pods -n kube-system -l app.kubernetes.io/name=ingress-nginx --field-selector=status.phase=Running | grep '1/1'; do echo 'Waiting for Nginx Ingress to be ready'; sleep 10; done"
  }
}


resource "helm_release" "argo_cd" {
  depends_on = [kubernetes_namespace.argocd, null_resource.check_nginx_ready]
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
