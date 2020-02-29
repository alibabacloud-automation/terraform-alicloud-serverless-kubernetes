variable "profile" {
  default = "default"
}
variable "region" {
  default = "cn-zhangjiakou"
}
variable "zone_id" {
  default = "cn-zhangjiakou-a"
}
variable "vpc_cidr" {
  default = "10.1.0.0/21"
}
variable "availability_zones" {
  default = ["cn-zhangjiakou-a", "cn-zhangjiakou-b", "cn-zhangjiakou-c"]
}


provider "alicloud" {
  region  = var.region
  profile = var.profile
}

###########################################
# Data sources to get VPC, vswitch details
###########################################

module "kubernetes-networking" {
  source = "terraform-alicloud-modules/kubernetes-networking/alicloud"
  region             = var.region
  profile            = var.profile
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  vswitch_cidrs      = [cidrsubnet(var.vpc_cidr, 4, 6)]
  create_nat_gateway = true
}

module "serverless-k8s" {
  source                  = "../../"
  region                  = var.region
  profile                 = var.profile
  serverless_cluster_name = "CreateByTerraform1"
  vpc_id                  = module.kubernetes-networking.this_vpc_id
  vswitch_id              = concat(module.kubernetes-networking.this_vswitch_ids, [""])[0]
  new_nat_gateway         = false
}