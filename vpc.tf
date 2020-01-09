// Zones data source for availability_zone
data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

// If there is not specifying vpc_id, the module will launch a new vpc
resource "alicloud_vpc" "new" {
  count      = var.new_vpc ? 1 : 0
  cidr_block = var.vpc_cidr
  name       = local.new_vpc_name
  tags       = local.new_vpc_tags
}

// According to the vswitch cidr blocks to launch several vswitches
resource "alicloud_vswitch" "new" {
  count             = var.new_vpc || var.vswitch_id == "" ? 1 : 0
  vpc_id            = concat(alicloud_vpc.new.*.id, [var.vpc_id])[0]
  cidr_block        = var.vswitch_cidr
  availability_zone = var.availability_zone != "" ? var.availability_zone : concat(data.alicloud_zones.default.ids.*, [""])[0]
  name              = local.new_vpc_name
  tags              = local.new_vpc_tags
}

resource "alicloud_nat_gateway" "new" {
  count  = var.new_vpc ? var.new_nat_gateway ? 1 : 0 : 0
  vpc_id = concat(alicloud_vpc.new.*.id, [""])[0]
  name   = local.new_vpc_name
  //  tags   = local.new_vpc_tags
}

resource "alicloud_eip" "new" {
  count     = var.new_vpc ? var.new_nat_gateway ? 1 : 0 : 0
  bandwidth = var.new_eip_bandwidth
  name      = local.new_vpc_name
  tags      = local.new_vpc_tags
}

resource "alicloud_eip_association" "new" {
  count         = var.new_vpc ? var.new_nat_gateway ? 1 : 0 : 0
  allocation_id = concat(alicloud_eip.new.*.id, [""])[0]
  instance_id   = concat(alicloud_nat_gateway.new.*.id, [""])[0]
}

resource "alicloud_snat_entry" "new" {
  count             = var.new_vpc ? var.new_nat_gateway ? 1 : 0 : 0
  snat_table_id     = concat(alicloud_nat_gateway.new.*.snat_table_ids, [""])[0]
  source_vswitch_id = concat(alicloud_vswitch.new.*.id, [""])[0]
  snat_ip           = concat(alicloud_eip.new.*.ip_address, [""])[0]
}