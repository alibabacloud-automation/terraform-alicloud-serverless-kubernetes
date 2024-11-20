
variable "region" {
  description = "The region of resources."
  default     = "cn-zhangjiakou"
  type        = string
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.1.0.0/21"
  type        = string
}
variable "availability_zones" {
  description = "The availability zones."
  type        = list(string)
  default     = ["cn-zhangjiakou-a", "cn-zhangjiakou-b", "cn-zhangjiakou-c"]
}
