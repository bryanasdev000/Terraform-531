output "sb_id" {
  value = google_compute_subnetwork.this.id
}

output "sb_gateway" {
  value = google_compute_subnetwork.this.gateway_address
}

output "sb_selflink" {
  value = google_compute_subnetwork.this.self_link
}
