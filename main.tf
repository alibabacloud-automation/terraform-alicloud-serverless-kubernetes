// Provider specific configs
provider "alicloud" {
  version                 = ">=1.58.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/serverless-kubernetes"
}

resource "alicloud_cs_serverless_kubernetes" "serverless" {
  name                           = local.k8s_name
  vpc_id                         = local.vpc_id
  vswitch_id                     = local.vswitch_id
  new_nat_gateway                = var.new_vpc ? false : var.new_nat_gateway
  endpoint_public_access_enabled = var.endpoint_public_access_enabled
  private_zone                   = false
  deletion_protection            = false
  tags                           = var.tags
  kube_config                    = var.kube_config_path
  client_cert                    = var.client_cert_path
  client_key                     = var.client_key_path
  cluster_ca_cert                = var.cluster_ca_cert_path
}

