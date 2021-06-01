# self_link subnet
# gateway subnet
# CIDR subnet
# region subnet

output "vpc_selflink" {
  description = ""
  value = google_compute_network.rede.self_link
}
output "subnet_selflink" {
  description = ""
  value = google_compute_subnetwork.subrede.self_link
}
output "subnet_gateway" {
  description = ""
  value = google_compute_subnetwork.subrede.gateway_address
}
output "subnet_cidr" {
  description = ""
  value = google_compute_subnetwork.subrede.ip_cidr_range
}
output "subnet_region" {
  description = ""
  value = google_compute_subnetwork.subrede.region
  sensitive = true
}

