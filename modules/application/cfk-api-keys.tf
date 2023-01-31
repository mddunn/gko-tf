resource "confluent_api_key" "cfk-sa-kafka-api-key" {
  display_name = "provisioning-sa-kafka-api-key"
  description  = "Kafka API Key that is owned by provisioning-sa"
  owner {
    id          = confluent_service_account.cfk-sa.id
    api_version = confluent_service_account.cfk-sa.api_version
    kind        = confluent_service_account.cfk-sa.kind
  }

  managed_resource {
    id          = data.confluent_kafka_cluster.cluster.id
    api_version = data.confluent_kafka_cluster.cluster.api_version
    kind        = data.confluent_kafka_cluster.cluster.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }
  depends_on = [
    confluent_service_account.cfk-sa
  ]
}

resource "confluent_api_key" "cfk-sa-schema-registry-api-key" {
  display_name = "env-manager-schema-registry-api-key"
  description  = "Schema Registry API Key that is owned by 'env-manager' service account"
  owner {
    id          = confluent_service_account.cfk-sa.id
    api_version = confluent_service_account.cfk-sa.api_version
    kind        = confluent_service_account.cfk-sa.kind
  }

  managed_resource {
    id          = data.confluent_schema_registry_cluster.sr.id
    api_version = data.confluent_schema_registry_cluster.sr.api_version
    kind        = data.confluent_schema_registry_cluster.sr.kind

    environment {
      id = data.confluent_environment.env.id
    }
  }
  depends_on = [
    confluent_service_account.cfk-sa
  ]
}