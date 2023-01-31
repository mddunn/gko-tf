data "confluent_environment" "env" {
  name = var.env_name
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