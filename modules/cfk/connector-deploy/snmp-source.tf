resource "kubernetes_manifest" "jdbc-source-connector" {
  manifest = {
    "apiVersion" = "platform.confluent.io/v1beta1"
    "kind"       = "Connector"
    "metadata"   = {
      "name"      = "snmp-source"
      "namespace" = "var.namespace"
    }
    "spec" = {
      "auth.password"     = "<Auth-Password>"
      "class"             = "io.confluent.connect.snmp.SnmpTrapSourceConnector"
      "configs"           = null
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
      "kafka.topic"         = var.topic_names
      "privacy.password"    = "<privacy-password>"
      "security.name"       = "<security-name>"
      "snmp.batch.size"     = "50"
      "snmp.listen.address" = "<ip-address to listen trap from>"
      "snmp.listen.port"    = "<port to listen trap from>"
      "snmp.v3.enabled"     = "true"
      "taskMax"             = 1
    }
  }
}