resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = var.grafana_chart_version
  namespace  = var.monitoring_namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = var.grafana_admin_password
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = var.grafana_url 
  }
  
   set {
    name  = "rbac.pspEnabled"
    value = "false"
  }

  set {
    name  = "rbac.pspUseAppArmor"
    value = "false"
  }

}
