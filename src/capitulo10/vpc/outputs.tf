output "vpc_id" {
  value = google_compute_network.this.id
}

output "vpc_gateway" {
  value = google_compute_network.this.gateway_ipv4
}

output "vpc_selflink" {
  value = google_compute_network.this.self_link
}
