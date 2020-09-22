resource "google_compute_region_instance_group_manager" "appserver" {
  name = "appserver-igm"

  base_instance_name         = "app"
  region                     = "us-central1"
  distribution_policy_zones  = ["us-central1-a", "us-central1-f"]

  version {
    instance_template = "projects/rubeus-proxysql/global/instanceTemplates/aula02"
  }

  target_size  = 2

  named_port {
    name = "http"
    port = 80
  }

}
resource "google_compute_region_instance_group_manager" "appserver2" {
  name = "appserver-igm2"

  base_instance_name         = "app"
  region                     = "us-central1"
  distribution_policy_zones  = ["us-central1-a", "us-central1-f"]

  version {
    instance_template = "projects/rubeus-proxysql/global/instanceTemplates/aula02"
  }

  target_size  = 2

  named_port {
    name = "http"
    port = 80
  }

}



module "mod-lb" {
  source = "./mod-lb"
  backends = [
    google_compute_region_instance_group_manager.appserver.instance_group,
    google_compute_region_instance_group_manager.appserver2.instance_group
  ]
}
