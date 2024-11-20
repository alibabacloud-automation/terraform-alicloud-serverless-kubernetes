data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  cidr_block = "10.2.0.0/21"
}

resource "alicloud_vswitch" "default" {
  vpc_id     = alicloud_vpc.default.id
  cidr_block = "10.2.1.0/24"
  zone_id    = data.alicloud_zones.default.zones[0].id
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

module "serverless-k8s" {
  source = "../../"

  serverless_cluster_name = "CreateByTerraform1-${random_integer.default.result}"
  vpc_id                  = alicloud_vpc.default.id
  vswitch_ids             = [alicloud_vswitch.default.id]
  service_cidr            = "172.21.0.0/20"
}
