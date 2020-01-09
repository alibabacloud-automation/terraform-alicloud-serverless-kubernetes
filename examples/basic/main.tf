module "k8s" {
  source                         = "../../"
  k8s_name_prefix                = "test_modules_basic"
  new_vpc                        = true
  endpoint_public_access_enabled = true
  new_nat_gateway                = true
}