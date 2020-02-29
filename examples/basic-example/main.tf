variable "profile" {
  default = "default"
}
variable "region" {
  default = "cn-beijing"
}
variable "zone_id" {
  default = "cn-beijing-h"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

###########################################
# Data sources to get VPC, vswitch details
###########################################

data "alicloud_vpcs" "default" {
  is_default = true
}

data "alicloud_security_groups" "default" {
  name_regex = "default"
  vpc_id     = data.alicloud_vpcs.default.ids.0
}

data "alicloud_vswitches" "default" {
  is_default = true
  zone_id    = var.zone_id
}

// If there is no default vswitch, create one.
resource "alicloud_vswitch" "default" {
  count             = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  availability_zone = var.zone_id
  vpc_id            = data.alicloud_vpcs.default.ids.0
  cidr_block        = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 4, 11)
}

module "serverless-k8s" {
  source                  = "../../"
  region                  = var.region
  profile                 = var.profile
  serverless_cluster_name = "CreateByTerraform1"
  vpc_id                  = data.alicloud_vpcs.default.ids.0
  vswitch_id              = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.default.*.id, [""])[0]
}