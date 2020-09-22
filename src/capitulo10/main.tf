module "vpc" {
  source = "./vpc"
}

module "subnet" {
  source = "./subnet"
  network = module.vpc.vpc_selflink
}

