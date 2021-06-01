output "ip" {
  value = google_compute_global_forwarding_rule.default.ip_address
  description = "IP do LB"
}
