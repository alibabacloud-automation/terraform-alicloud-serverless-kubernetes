//# common variables
variable "region" {
  description = "The region ID used to launch this module resources. If not set, it will be sourced from followed by ALICLOUD_REGION environment variable and profile."
  default     = ""
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
  type        = bool
  default     = false
}

variable "k8s_name_prefix" {
  description = "The name prefix used to create serverless kubernetes cluster."
  default     = "terraform-alicloud-serverless-kubernetes"
}


# VPC variables
variable "new_vpc" {
  description = "Create a new vpc for this module."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "A existing vpc id used to create several vswitches and other resources. If 'new_vpc' set false, this field must be specified."
  default     = ""
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  default     = "10.0.0.0/8"
}

variable "vswitch_id" {
  description = "The vswitch id of existing vswitch."
  default     = ""
}

variable "vswitch_cidr" {
  description = "The cidr block used to launch a new vswitch when vswitch_id is not set."
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Available zone id used to create a new vswitch when 'vswitch_id' is not specified. If not set, data source `alicloud_zones` will return one automatically."
  type        = string
  default     = ""
}

variable "new_eip_bandwidth" {
  description = "The bandwidth used to create a new EIP when 'new_vpc' is true."
  default     = 50
}

variable "new_nat_gateway" {
  description = "Seting it to true can create a new nat gateway automatically in a existing VPC. If 'new_vpc' is true, it will be ignored."
  type        = bool
  default     = false
}

variable "tags" {
  description = "The tags of serverless k8s cluster."
  default = {
    "k-a" : "v-a",
    "k-b" : "v-b"
  }
}

variable "endpoint_public_access_enabled" {
  description = "Whether to create internet eip for API Server. Default to false."
  default     = false
}

variable "kube_config_path" {
  description = "The path of kube config, like ~/.kube/config"
  default     = ""
}
variable "client_cert_path" {
  description = "The path of client certificate, like ~/.kube/client-cert.pem"
  default     = ""
}
variable "client_key_path" {
  description = "The path of client key, like ~/.kube/client-key.pem"
  default     = ""
}
variable "cluster_ca_cert_path" {
  description = "The path of cluster ca certificate, like ~/.kube/cluster-ca-cert.pem"
  default     = ""
}



