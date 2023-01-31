resource "confluent_ksql_cluster" "ksql-cluster" {
  display_name = var.ksql_name
  csu = 1
  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster.id
  }
  credential_identity {
    id = confluent_service_account.ksql-sa.id
  }
  environment {
    id = data.confluent_environment.env.id
  }
  depends_on = [
    confluent_role_binding.ksql-sa-rb,
    confluent_role_binding.ksql-sa-sr-rb
  ]
}