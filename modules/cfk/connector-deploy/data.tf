data "confluent_environment" "env" {
  display_name = var.env_name
}

data "confluent_kafka_cluster" "cluster" {
  display_name = var.cluster_name
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

data "kubernetes_resource" "connect-cluster" {
  api_version = "platform.confluent.io/v1beta1"
  kind        = "Connect"

  metadata {
    name      = "connect"
    namespace = var.namespace
  }
}