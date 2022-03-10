data "alicloud_zones" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/12"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "example" {
  source = "../.."

  create = true

  serverless_cluster_name        = "tf-testacc-name"
  vpc_id                         = module.vpc.this_vpc_id
  vswitch_ids                    = module.vpc.this_vswitch_ids
  new_nat_gateway                = true
  deletion_protection            = var.deletion_protection
  service_discovery_types        = ["PrivateZone"]
  endpoint_public_access_enabled = true
  force_update                   = false
  tags                           = var.tags

}