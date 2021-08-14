output "instance_group" {
  value = google_compute_region_instance_group_manager.this.instance_group
  description = "URL do MIG"
}

output "self_link" {
  value = google_compute_region_instance_group_manager.this.self_link
  description = "Self link do MIG"
}
