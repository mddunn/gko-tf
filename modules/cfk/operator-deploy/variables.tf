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

variable "licenseKey" {
  description = "license"
  type        = string
  nullable = false
}