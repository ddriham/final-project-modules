resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = var.prometheus_chart_version
  namespace  = var.monitoring_namespace

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }


set {
  name  = "pvcProtectionEnabled"
  value = false
}
}
# kubectl patch pvc prometheus-server -n monitoring -p '{"metadata":{"finalizers":null}}'
# kubectl patch pvc storage-prometheus-alertmanager-0 -n monitoring -p '{"metadata":{"finalizers":null}}'