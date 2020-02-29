// Provider specific configs
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/serverless-kubernetes"
}


resource "alicloud_cs_serverless_kubernetes" "this" {
  count                          = var.create ? 1 : 0
  name                           = var.serverless_cluster_name
  vpc_id                         = var.vpc_id
  vswitch_id                     = var.vswitch_id
  new_nat_gateway                = var.new_nat_gateway
  deletion_protection            = var.deletion_protection
  private_zone                   = var.private_zone
  endpoint_public_access_enabled = var.endpoint_public_access_enabled
  kube_config                    = var.kube_config
  client_cert                    = var.client_cert
  client_key                     = var.client_key
  cluster_ca_cert                = var.cluster_ca_cert
  tags                           = var.tags
  force_update                   = var.force_update
}

