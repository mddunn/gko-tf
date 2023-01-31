data "confluent_environment" "env" {
  display_name = var.env
}

data "confluent_kafka_cluster" "cluster" {
  display_name = var.cluster
  environment {
    id = data.confluent_environment.env.id
  }
}

data "confluent_schema_registry_cluster" "sr" {
  display_name = "Stream Governance Package"
  environment {
    id = data.confluent_environment.env.id
  }
}

data "kubernetes_namespace" "cfk-ns" {
  metadata {
    name = var.namespace
  }
}