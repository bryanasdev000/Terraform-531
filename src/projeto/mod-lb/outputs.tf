#output "iplb" {
#  value = google_compute_address.default.address
#  description = "IP do lb"
#}

#output "ip" {
#  value = google_compute_address.default
#  description = "IP full"
#}

output "fwd" {
  value = google_compute_global_forwarding_rule.default
  description = "fwd full"
}
