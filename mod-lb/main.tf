resource "google_compute_global_forwarding_rule" "default" {
  name       = "global-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}

resource "google_compute_target_http_proxy" "default" {
  name        = "target-proxy"
  url_map     = google_compute_url_map.default.self_link
}

resource "google_compute_url_map" "default" {
  name            = "url-map-target-proxy"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_backend_service" "default" {
  name        = "backend"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  # Implementacao seguindo o provider da GCP
  dynamic "backend" {
    for_each = var.backends
    content {
      group                 = backend.value
      # Garante que vai alternar mais rapidamente entre  as instancais
      balancing_mode        = var.balancing_mode
      max_rate_per_instance = 1
    }
  }
  # Implementacao se fosse seguir a API REST
  #backend {
  #    group = module.mig-us.self_link,
  #    group = module.mig-asia.self_link
  #      }
  health_checks = [google_compute_http_health_check.default.self_link]
}

resource "google_compute_http_health_check" "default" {
  name               = "check-backend"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}
