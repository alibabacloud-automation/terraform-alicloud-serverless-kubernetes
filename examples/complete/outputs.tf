# Output VPC
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = module.example.this_vpc_id
}

output "this_vswitch_id" {
  description = "The ID of the VSwitch."
  value       = module.example.this_vswitch_id
}

# Output kubernetes resource
output "this_cluster_id" {
  description = "ID of the kunernetes cluster."
  value       = module.example.this_cluster_id
}

output "this_deletion_protection" {
  description = "Whether enable deletion protection"
  value       = module.example.this_deletion_protection
}

output "this_endpoint_public_access_enabled" {
  description = "Whether enable public access"
  value       = module.example.this_endpoint_public_access_enabled
}

output "this_private_zone" {
  description = "The private zone of the kunernetes cluster."
  value       = module.example.this_private_zone
}

output "this_kube_config" {
  description = "The kube config of the kunernetes cluster."
  value       = module.example.this_kube_config
}

output "this_tags" {
  description = "The tags of the kunernetes cluster."
  value       = module.example.this_tags
}