//Cluster admin for the demo, would need to refine for a production deployment

//CC Connector
resource "confluent_role_binding" "connect-sa-rb" {
  principal   = "User:${confluent_service_account.connect-sa.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = data.confluent_kafka_cluster.cluster.rbac_crn
}

resource "confluent_role_binding" "connect-sa-sr-rb" {
  principal   = "User:${confluent_service_account.connect-sa.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", data.confluent_schema_registry_cluster.sr.resource_name, "subject=*")
}

//CFK self-managed connect
resource "confluent_role_binding" "cfk-sa-rb" {
  principal   = "User:${confluent_service_account.cfk-sa.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = data.confluent_kafka_cluster.cluster.rbac_crn
}

resource "confluent_role_binding" "cfk-sa-sr-rb" {
  principal   = "User:${confluent_service_account.cfk-sa.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", data.confluent_schema_registry_cluster.sr.resource_name, "subject=*")
}

//ksqlDB cluster
resource "confluent_role_binding" "ksql-sa-rb" {
  principal   = "User:${confluent_service_account.ksql-sa.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = data.confluent_kafka_cluster.cluster.rbac_crn
}

resource "confluent_role_binding" "ksql-sa-sr-rb" {
  principal   = "User:${confluent_service_account.ksql-sa.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", data.confluent_schema_registry_cluster.sr.resource_name, "subject=*")
}

