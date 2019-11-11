//# common variables
variable "region" {
  default = "cn-beijing"
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  default     = false
}

variable "serverless_cluster_name" {
  description = "The cluster name used to create a new cluster"
  default     = "tf-serverless-demo-0001"
}

variable "vpc_id" {
  description = "An existing vpc id."
  default     = ""
}

variable "vswitch_id" {
  description = "An existing vswitch id."
  default     = ""
}

variable "new_nat_gateway" {
  description = "Whether to create a new nat gateway. In this template, a new nat gateway will create a nat gateway, eip and server snat entries."
  default     = "true"
}

variable "deletion_protection" {
  description = "Whether enable the deletion protection or not."
  default     = false
}

variable "private_zone" {
  description = "Whether to create internet  eip for API Server."
  default     = false
}

variable "endpoint_public_access_enabled" {
  description = "Whether to create internet eip for API Server."
  default     = true
}

variable "kube_config" {
  description = "The path of kube config, like `~/.kube/config`."
  default     = ""
}

variable "client_cert" {
  description = "The path of client certificate, like `~/.kube/client-cert.pem`."
  default     = ""
}

variable "client_key" {
  description = "The path of client key, like `~/.kube/client-key.pem`."
  default     = ""
}

variable "cluster_ca_cert" {
  description = "The path of cluster ca certificate, like `~/.kube/cluster-ca-cert.pem`"
  default     = ""
}

variable "force_update" {
  description = "Then you want to change `vpc_id` and `vswitch_id`, you have to set this field to true, then the cluster will be recreated."
  default     = false
}

# Instance typs variables
variable "cpu_core_count" {
  description = "CPU core count is used to fetch instance types."
  default     = 1
}

variable "memory_size" {
  description = "Memory size used to fetch instance types."
  default     = 2
}

variable "tags" {
  description = "A map of tags assigned to the kubernetes cluster."
  type        = map(string)
  default     = {}
}

# VSwitch variables

variable "vswitch_name_regex" {
  description = "A default filter applied to retrieve existing vswitches by name regex."
  default     = ""
}

variable "vswitch_tags" {
  description = "A default filter applied to retrieve existing vswitches by tags."
  type        = map(string)
  default     = {}
}

variable "vswitch_resource_group_id" {
  description = "A id string to filter vswitches by resource group id."
  default     = ""
}






