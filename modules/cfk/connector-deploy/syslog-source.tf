resource "kubernetes_manifest" "syslog-source-connector" {
  manifest = {
    "apiVersion" = "platform.confluent.io/v1beta1"
    "kind"       = "Connector"
    "metadata"   = {
      "name"      = "syslog-source"
      "namespace" = "var.namespace"
    }
    "spec" = {
      "class"   = "io.confluent.connect.syslog.SyslogSourceConnector"
      "configs" = {
        "confluent.topic.bootstrap.servers"  = "<URL>:9092"
        "confluent.topic.replication.factor" = "1"
        "syslog.listener"                    = "TCP"
        "syslog.port"                        = "5454"
      }
      "connectClusterRef" = {
        "name" = "connect"
      }
      "connectRest" = {
        "authentication" = {
          "basic" = {
            "secretRef" = "connector-basic"
          }
          "type" = "basic"
        }
      }
      "taskMax" = 1
    }
  }
}