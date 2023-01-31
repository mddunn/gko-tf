resource "confluent_service_account" "provisioning-sa" {
  display_name = var.provisioning_sa
  description  = "Service account for CC Elastic Sink connector"
}