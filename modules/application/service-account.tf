resource "confluent_service_account" "connect-sa" {
  display_name = var.connect_sa
  description  = "Service account for CC Elastic Sink connector"
}

resource "confluent_service_account" "cfk-sa" {
  display_name = var.cfk_sa
  description  = "Service account for CFK self-managed Connect cluster"
}

resource "confluent_service_account" "ksql-sa" {
  display_name = var.ksql_sa
  description  = "Service account for CFK self-managed Connect cluster"
}