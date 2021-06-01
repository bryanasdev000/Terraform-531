output "self_link" {
  value = google_compute_instance_template.this.self_link
  description = "Self link do MIG"
}
