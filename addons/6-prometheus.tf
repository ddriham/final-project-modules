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
}

resource "kubernetes_service" "prometheus_server" {
  metadata {
    name      = "prometheus-server"
    namespace = var.monitoring_namespace
  }

  spec {
    selector = {
      app = "prometheus"
    }

    port {
      name        = "http"
      port        = 80
      target_port = "9090"
    }

    type = "LoadBalancer"
  }
}

# kubectl patch pvc prometheus-server -n monitoring -p '{"metadata":{"finalizers":null}}'
# kubectl patch pvc storage-prometheus-alertmanager-0 -n monitoring -p '{"metadata":{"finalizers":null}}'
# kubectl delete all --all -n monitoring --force --grace-period=0 && kubectl delete pvc --all -n monitoring --force --grace-period=0
