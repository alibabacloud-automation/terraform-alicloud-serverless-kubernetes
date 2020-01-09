// Output VPC
output "this_vpc_id" {
  description = "The ID of the VPC."
  value       = alicloud_cs_serverless_kubernetes.serverless.vpc_id
}

output "this_vswitch_id" {
  description = "The ID of the VSwitch."
  value       = alicloud_cs_serverless_kubernetes.serverless.vswitch_id
}

// Output kubernetes resource
output "this_cluster_id" {
  description = "ID of the kunernetes cluster."
  value       = [alicloud_cs_serverless_kubernetes.serverless.id]
}

output "this_deletion_protection" {
  description = "Whether to set delete protection."
  value       = alicloud_cs_serverless_kubernetes.serverless.deletion_protection
}

output "this_endpoint_public_access_enabled" {
  description = "Whether enable public access or not"
  value       = alicloud_cs_serverless_kubernetes.serverless.endpoint_public_access_enabled
}



