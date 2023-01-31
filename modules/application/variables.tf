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

variable "ksql_name" {
  type = string
  description = "CC ksql cluster display name"
  default = "demo-ksql"
  nullable = false
}

variable "connect_sa" {
  type = string
  description = "CC Connector SA"
  default = "demo-connect"
  nullable = false
}

variable "cfk_sa" {
  type = string
  description = "CFK SA"
  default = "demo-cfk"
  nullable = false
}

variable "ksql_sa" {
  type = string
  description = "CC ksql SA"
  default = "demo-ksql"
  nullable = false
}

variable "topic_names" {
  type = list
  description = "CC topic names"
  default = ["demo-topic"]
  nullable = false
}

