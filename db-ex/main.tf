module "db" {
  source = "./database"
  vm_name = "redzone-db"
  vm_type = "e2-medium"
  vm_zone = "southamerica-east1-a"
  vm_net  = "default"
  disk_size = 30
  disk_name = "redzone-db-external-disk"
}

output "db-ip-externo" {
  value = module.db.ip_externo_vm
}
