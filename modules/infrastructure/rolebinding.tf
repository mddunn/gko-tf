resource "confluent_role_binding" "provisioning-sa-rb" {
  principal   = "User:${confluent_service_account.provisioning-sa.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.cluster.rbac_crn
}

resource "confluent_role_binding" "provisioning-sa-sr-rb" {
  principal   = "User:${confluent_service_account.provisioning-sa.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", confluent_schema_registry_cluster.sr.resource_name, "subject=*")
}