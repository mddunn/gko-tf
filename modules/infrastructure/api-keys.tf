resource "confluent_api_key" "provisioning-sa-cloud-api-key" {
  display_name = "provisioning-sa-cloud-api-key"
  description  = "Cloud API Key that is owned by provisioning-sa"
  owner {
    id          = confluent_service_account.provisioning-sa.id
    api_version = confluent_service_account.provisioning-sa.api_version
    kind        = confluent_service_account.provisioning-sa.kind
  }
  depends_on = [
    confluent_service_account.provisioning-sa
  ]
}

resource "confluent_api_key" "provisioning-sa-kafka-api-key" {
  display_name = "provisioning-sa-kafka-api-key"
  description  = "Kafka API Key that is owned by provisioning-sa"
  owner {
    id          = confluent_service_account.provisioning-sa.id
    api_version = confluent_service_account.provisioning-sa.api_version
    kind        = confluent_service_account.provisioning-sa.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.cluster.id
    api_version = confluent_kafka_cluster.cluster.api_version
    kind        = confluent_kafka_cluster.cluster.kind

    environment {
      id = confluent_environment.env.id
    }
  }
  depends_on = [
    confluent_service_account.provisioning-sa,
    confluent_environment.env,
    confluent_kafka_cluster.cluster
  ]
}

resource "confluent_api_key" "provisioning-sa-schema-registry-api-key" {
  display_name = "env-manager-schema-registry-api-key"
  description  = "Schema Registry API Key that is owned by 'env-manager' service account"
  owner {
    id          = confluent_service_account.provisioning-sa.id
    api_version = confluent_service_account.provisioning-sa.api_version
    kind        = confluent_service_account.provisioning-sa.kind
  }

  managed_resource {
    id          = confluent_schema_registry_cluster.sr.id
    api_version = confluent_schema_registry_cluster.sr.api_version
    kind        = confluent_schema_registry_cluster.sr.kind

    environment {
      id = confluent_environment.env.id
    }
  }
  depends_on = [
    confluent_service_account.provisioning-sa,
    confluent_environment.env,
    confluent_kafka_cluster.cluster,
    confluent_schema_registry_cluster.sr
  ]
}