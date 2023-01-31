resource "confluent_kafka_topic" "topics" {
  for_each = toset(var.topic_names)
  topic_name         = each.key
}