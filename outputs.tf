# Output VPC
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].vpc_id, [""])[0]
}

output "this_vswitch_id" {
  description = "The ID of the VSwitch."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].vswitch_ids, [""])[0]
}

# Output kubernetes resource
output "this_cluster_id" {
  description = "ID of the kunernetes cluster."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].id, [""])[0]
}

output "this_deletion_protection" {
  description = "Whether enable deletion protection"
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].deletion_protection, [""])[0]
}

output "this_endpoint_public_access_enabled" {
  description = "Whether enable public access"
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].endpoint_public_access_enabled, [""])[0]
}

output "this_private_zone" {
  description = "The private zone of the kunernetes cluster."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].private_zone, [""])[0]
}

output "this_kube_config" {
  description = "The kube config of the kunernetes cluster."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].kube_config, [""])[0]
}

output "this_tags" {
  description = "The tags of the kunernetes cluster."
  value       = concat(alicloud_cs_serverless_kubernetes.this[*].tags, [{}])[0]
}