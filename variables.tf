variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

// Kubernetes cluster setting
variable "create" {
  description = "Whether to create serverless kubernetes cluster."
  type        = bool
  default     = true
}

variable "serverless_cluster_name" {
  description = "The cluster name used to create a new cluster"
  type        = string
  default     = "tf-serverless-demo-0001"
}

variable "vpc_id" {
  description = "An existing vpc id."
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "An existing vswitch id."
  type        = string
  default     = ""
}

variable "new_nat_gateway" {
  description = "Whether to create a new nat gateway. In this template, a new nat gateway will create a nat gateway, eip and server snat entries."
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether enable the deletion protection or not."
  type        = bool
  default     = false
}

variable "private_zone" {
  description = "Whether to create internet eip for API Server."
  type        = bool
  default     = false
}

variable "endpoint_public_access_enabled" {
  description = "Whether to create internet eip for API Server."
  type        = bool
  default     = true
}

variable "kube_config" {
  description = "The path of kube config, like `~/.kube/config`."
  type        = string
  default     = ""
}

variable "client_cert" {
  description = "The path of client certificate, like `~/.kube/client-cert.pem`."
  type        = string
  default     = ""
}

variable "client_key" {
  description = "The path of client key, like `~/.kube/client-key.pem`."
  type        = string
  default     = ""
}

variable "cluster_ca_cert" {
  description = "The path of cluster ca certificate, like `~/.kube/cluster-ca-cert.pem`"
  type        = string
  default     = ""
}

variable "force_update" {
  description = "Then you want to change `vpc_id` and `vswitch_id`, you have to set this field to true, then the cluster will be recreated."
  type        = bool
  default     = false
}

# Instance typs variables
variable "cpu_core_count" {
  description = "CPU core count is used to fetch instance types."
  type        = number
  default     = 1
}

variable "memory_size" {
  description = "Memory size used to fetch instance types."
  type        = number
  default     = 2
}

variable "tags" {
  description = "A map of tags assigned to the kubernetes cluster."
  type        = map(string)
  default     = {}
}





