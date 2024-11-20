provider "alicloud" {
  region = var.region
}

###########################################
# Data sources to get VPC, vswitch details
###########################################

module "kubernetes-networking" {
  source  = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  version = "1.3.0"

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  vswitch_cidrs      = [cidrsubnet(var.vpc_cidr, 4, 6)]
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "serverless-k8s" {
  source = "../../"

  serverless_cluster_name = "CreateByTerraform1-${random_integer.default.result}"
  vpc_id                  = module.kubernetes-networking.this_vpc_id
  vswitch_id              = concat(module.kubernetes-networking.this_vswitch_ids, [""])[0]
  service_cidr            = "172.21.0.0/20"
}
