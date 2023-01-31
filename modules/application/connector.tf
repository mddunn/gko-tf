resource "confluent_connector" "elasticsearch_sink" {
  environment {
    id = data.confluent_environment.env.id
  }
  kafka_cluster {
    id = data.confluent_kafka_cluster.cluster.id #
  }

  // Block for custom *nonsensitive* configuration properties that are *not* labelled with "Type: password" under "Configuration Properties" section in the docs:
  // https://docs.confluent.io/cloud/current/connectors/cc-s3-sink.html#configuration-properties
  config_nonsensitive = {
    "key.ignore"                    = "false"
    "schema.ignore"                 = "false"
    "compact.map.entries"           = "true"
    "behavior.on.null.values"       = "ignore"
    "drop.invalid.message"          = "false"
    "batch.size"                    = "2000"
    "linger.ms"                     = "1000"
    "flush.timeout.ms"              = "10000"
    "connection.compression"        = "true"
    "auto.create.indices.at.start"  = "true"
    "connection.url"                = "<elasticsearch-URI>",
    "connection.user"               = "<elasticsearch-username>",
    "connection.password"           = "<elasticsearch-password>",
  }

  depends_on = [
    confluent_service_account.connect-sa,
    confluent_role_binding.connect-sa-rb,
    confluent_role_binding.connect-sa-sr-rb,
    confluent_kafka_topic.topics
  ]

  lifecycle {
    prevent_destroy = true
  }
}