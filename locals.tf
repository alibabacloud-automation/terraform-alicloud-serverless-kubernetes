locals {
  k8s_name     = substr(join("-", [var.k8s_name_prefix, random_uuid.this.result]), 0, 63)
  new_vpc_name = "for-${local.k8s_name}"
  new_vpc_tags = {
    Created = "Terraform"
    For     = "modules/terraform-alicloud-serverless-kubernetes"
    K8s     = local.k8s_name
  }
  vpc_id     = var.new_vpc ? alicloud_vpc.new.0.id : var.vpc_id
  vswitch_id = var.vswitch_id != "" ? var.vswitch_id : alicloud_vswitch.new.0.id
}

resource "random_uuid" "this" {}