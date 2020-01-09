// Output VPC
output "this_vpc_id" {
  value = module.k8s.this_vpc_id
}

output "this_vswitch_id" {
  value = module.k8s.this_vswitch_id
}

// Output kubernetes resource
output "this_cluster_id" {
  value = module.k8s.this_cluster_id
}

output "this_deletion_protection" {
  value = module.k8s.this_deletion_protection
}

output "this_endpoint_public_access_enabled" {
  value = module.k8s.this_endpoint_public_access_enabled
}



