data "alicloud_zones" "default" {
}

module "vpc" {
  source  = "alibaba/vpc/alicloud"
  version = "~>1.11.0"

  create             = true
  vpc_cidr           = "10.2.0.0/21"
  vswitch_cidrs      = ["10.2.1.0/24"]
  availability_zones = [data.alicloud_zones.default.zones[0].id]
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "example" {
  source = "../.."

  create = true

  serverless_cluster_name        = "tf-testacc-name-${random_integer.default.result}"
  vpc_id                         = module.vpc.this_vpc_id
  vswitch_ids                    = module.vpc.this_vswitch_ids
  new_nat_gateway                = true
  deletion_protection            = var.deletion_protection
  service_cidr                   = "172.21.0.0/20"
  service_discovery_types        = ["PrivateZone"]
  endpoint_public_access_enabled = true
  tags                           = var.tags

}
