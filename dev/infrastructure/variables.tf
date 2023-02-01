variable "confluent_cloud_api_key" {
  type = string
  description = "CC cloud api key"
  nullable = false
}

variable "confluent_cloud_api_secret" {
  type = string
  description = "CC cloud api secret"
  nullable = false
}

variable "context" {
  description = "K8s context"
  type        = string
  default = "demo-context"
  nullable = false
}