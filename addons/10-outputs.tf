output "prometheus_lb_url" {
  value = kubernetes_service.prometheus_server.status.load_balancer.ingress[0].hostname
}

output "grafana_lb_url" {
  value = kubernetes_service.grafana.status.load_balancer.ingress[0].hostname
}
