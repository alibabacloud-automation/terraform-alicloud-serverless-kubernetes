locals {
  vswitch_id = var.vswitch_id != "" ? var.vswitch_id : data.alicloud_vswitches.this.ids[0]
  vpc_id     = var.vpc_id != "" ? var.vpc_id : data.alicloud_vpcs.this.ids[0]
  zone_id    = var.vswitch_id != "" ? data.alicloud_vswitches.this.vswitches.0.zone_id : data.alicloud_zones.this.ids[0]
}


// Instance_types data source for instance_type
data "alicloud_instance_types" "this" {
  availability_zone = local.zone_id
  cpu_core_count    = var.cpu_core_count
  memory_size       = var.memory_size
}

// Zones data source for availability_zone
data "alicloud_zones" "this" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vswitches" "this" {
  name_regex        = var.vswitch_name_regex
  tags              = var.vswitch_tags
  resource_group_id = var.vswitch_resource_group_id
}

data "alicloud_vpcs" "this" {
  vswitch_id = local.vswitch_id
}

