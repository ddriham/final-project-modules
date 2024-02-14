resource "kubernetes_ingress_v1" "grafana" {
  metadata {
    name      = "grafana-ingress"
    namespace = "monitoring"
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "${var.eks_name}.grafana.local"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = data.kubernetes_service.grafana.metadata.0.name
              port {
                number = data.kubernetes_service.grafana.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "prometheus" {
  metadata {
    name      = "prometheus-ingress"
    namespace = "monitoring"
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "${var.eks_name}.prometheus.local"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = data.kubernetes_service.prometheus.metadata.0.name
              port {
                number = data.kubernetes_service.prometheus.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "argocd" {
  depends_on = [
    helm_release.argo_cd
  ]
  metadata {
    name      = "argocd-ingress"
    namespace = "argocd"
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "${var.eks_name}.argo.local"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = data.kubernetes_service.argocd.metadata.0.name
              port {
                number = data.kubernetes_service.argocd.spec.0.port.0.port
              }
            }
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
    name      = "argo-cd-argocd-server"
    namespace = "argocd"
  }
}