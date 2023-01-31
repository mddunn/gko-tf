variable "context" {
  description = "K8s context"
  type        = string
  default = "demo-context"
  nullable = false
}

variable "namespace" {
  description = "CFK namespace"
  type        = string
  default = "confluent"
  nullable = false
}

variable "env_name" {
  type = string
  description = "CC env display name"
  default = "demo-env"
  nullable = false
}

variable "cluster_name" {
  type = string
  description = "CC cluster display name"
  default = "demo-cluster"
  nullable = false
}