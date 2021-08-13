module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 3.0"
    project_id   = "rubeus-proxysql"
    network_name = "vpc-modulo"
    auto_create_subnetworks = true
    subnets = []
}
