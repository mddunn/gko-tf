//Confluent Cloud environment
resource "confluent_environment" "env" {
  display_name = var.env_name

  lifecycle {
    prevent_destroy = true
  }
}

//Confluent Cloud Kafka cluster
resource "confluent_kafka_cluster" "cluster" {
  display_name = var.cluster_name
  availability = var.cluster_availability
  cloud        = var.cluster_cloud
  region       = var.cluster_region
  standard {}
  environment {
    id = confluent_environment.env.id
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [confluent_environment.env]
}

//Confluent Cloud Schema Registry cluster
data "confluent_schema_registry_region" "sr-region" {
  cloud   = var.cluster_cloud
  region  = var.cluster_region
  package = var.sr_package
}

resource "confluent_schema_registry_cluster" "sr" {
  package = data.confluent_schema_registry_region.sr-region.package

  environment {
    id = confluent_environment.env.id
  }

  region {
    id = data.confluent_schema_registry_region.sr-region.id
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [confluent_environment.env]
}