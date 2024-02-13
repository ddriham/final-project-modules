resource "kubernetes_ingress" "grafana" {
  metadata {
    name      = "grafana-ingress"
    namespace = "monitoring"
  }

  spec {
    rule {
      host = "${var.eks_name}.grafana.local"
      http {
        path {
          backend {
            service_name = data.kubernetes_service.grafana.metadata[0].name
            service_port = data.kubernetes_service.grafana.spec[0].port[0].port
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress" "prometheus" {
  metadata {
    name      = "prometheus-ingress"
    namespace = "monitoring"
  }

  spec {
    rule {
      host = "${var.eks_name}.prometheus.local"
      http {
        path {
          backend {
            service_name = data.kubernetes_service.prometheus.metadata[0].name
            service_port = data.kubernetes_service.prometheus.spec[0].port[0].port
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress" "argocd" {
  metadata {
    name      = "argocd-ingress"
    namespace = "argocd"
  }

  spec {
    rule {
      host = "${var.eks_name}.argo.local"
      http {
        path {
          backend {
            service_name = data.kubernetes_service.argocd.metadata[0].name
            service_port = data.kubernetes_service.argocd.spec[0].port[0].port
          }
        }
      }
    }
  }
}

data "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"
  }
}

data "kubernetes_service" "prometheus" {
  metadata {
    name      = "prometheus-server"
    namespace = "monitoring"
  }
}

data "kubernetes_service" "argocd" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }
}
