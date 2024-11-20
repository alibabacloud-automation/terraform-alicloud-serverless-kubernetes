# Kubernetes cluster setting
variable "deletion_protection" {
  description = "Whether enable the deletion protection or not."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags assigned to the kubernetes cluster."
  type        = map(string)
  default = {
    Name = "K8S"
  }
}