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

variable "kafka_id" {
  type = string
  description = "CC kafka cluster ID"
  nullable = false
}

variable "kafka_rest_endpoint" {
  type = string
  description = "CC kafka rest endpoint"
  nullable = false
}

variable "kafka_api_key" {
  type = string
  description = "CC kafka api key"
  nullable = false
}

variable "kafka_api_secret" {
  type = string
  description = "CC kafka api secret"
  nullable = false
}