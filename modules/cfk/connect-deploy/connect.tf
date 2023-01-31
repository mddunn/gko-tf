resource "kubernetes_manifest" "connect-cluster" {
  manifest = {
    "apiVersion" = "platform.confluent.io/v1beta1"
    "kind" = "Connect"
    "metadata" = {
      "name" = "connect"
      "namespace" = "confluent"
    }
    "spec" = {
      "authentication" = {
        "basic" = {
          "secretRef" = "connect-basic"
        }
        "type" = "basic"
      }
      "build" = {
        "onDemand" = {
          "plugins" = {
            "confluentHub" = [
              {
                "name" = "kafka-connect-syslog"
                "owner" = "confluentinc"
                "version" = "1.5.1"
              },
              {
                "name" = "kafka-connect-snmp"
                "owner" = "confluentinc"
                "version" = "1.2.1"
              },
              {
                "name" = "kafka-connect-jdbc"
                "owner" = "debezium"
                "version" = "10.6.0"
              },
            ]
            "locationType" = "confluentHub"
          }
          "storageLimit" = "20G"
        }
        "type" = "onDemand"
      }
      "configOverrides" = {
        "jvm" = [
          "-Xmx1g",
          "-Xms1g",
        ]
        "log4j" = [
          "log4j.logger.io.confluent.connect.http=DEBUG",
          "org.apache.kafka.connect=DEBUG",
        ]
        "server" = [
          "database.history.kafka.bootstrap.servers=${data.confluent_kafka_cluster.cluster.bootstrap_endpoint}",
          "database.history.consumer.security.protocol=SASL_SSL",
          "database.history.consumer.ssl.endpoint.identification.algorithm=https",
          "database.history.consumer.sasl.mechanism=PLAIN",
          "database.history.consumer.sasl.jaas.config= org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${file:/mnt/secrets/connect-cloud-plain/plain.txt:username}\" password=\"${file:/mnt/secrets/connect-cloud-plain/plain.txt:password}\"",
          "database.history.producer.security.protocol=SASL_SSL",
          "database.history.producer.ssl.endpoint.identification.algorithm=https",
          "database.history.producer.sasl.mechanism=PLAIN",
          "database.history.producer.sasl.jaas.config= org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${file:/mnt/secrets/connect-cloud-plain/plain.txt:username}\" password=\"${file:/mnt/secrets/connect-cloud-plain/plain.txt:password}\"",
          "ssl.endpoint.identification.algorithm=https",
          "consumer.ssl.endpoint.identification.algorithm=https",
          "producer.ssl.endpoint.identification.algorithm=https",
          "producer.enable.idempotence=true",
          "producer.acks=all",
        ]
      }
      "connectorOverridePolicy" = "All"
      "dependencies" = {
        "kafka" = {
          "authentication" = {
            "jaasConfig" = {
              "secretRef" = "cloud-plain"
            }
            "type" = "plain"
          }
          "bootstrapEndpoint" = data.confluent_kafka_cluster.cluster.bootstrap_endpoint
          "tls" = {
            "enabled" = true
            "ignoreTrustStoreConfig" = true
          }
        }
        "schemaRegistry" = {
          "authentication" = {
            "basic" = {
              "secretRef" = "cloud-sr-access"
            }
            "type" = "basic"
          }
          "url" = data.confluent_schema_registry_cluster.sr.rest_endpoint
        }
      }
      "image" = {
        "application" = "confluentinc/cp-server-connect:7.3.1"
        "init" = "confluentinc/confluent-init-container:2.5.1"
      }
      "license" = {
        "globalLicense" = true
      }
      "podTemplate" = {
        "podSecurityContext" = {
          "fsGroup" = 1000
          "runAsNonRoot" = true
          "runAsUser" = 1000
        }
      }
      "replicas" = 1
    }
  }
  depends_on = [
    data.kubernetes_namespace.cfk-ns,
    kubernetes_secret.cloud-plain,
    kubernetes_secret.cloud-sr-access,
    kubernetes_secret.connect-basic
  ]
}