resource "kubernetes_manifest" "jdbc-source-connector" {
  manifest = {
    "apiVersion" = "platform.confluent.io/v1beta1"
    "kind"       = "Connector"
    "metadata"   = {
      "name"      = "jdbc-source"
      "namespace" = "var.namespace"
    }
    "spec" = {
      "class"   = "io.confluent.connect.jdbc.JdbcSourceConnector"
      "configs" = {
        "connection.password"      = "env.MYSQL_CONNECTION_PASSWORD"
        "connection.url"           = "jdbc:mysql://localhost:3306"
        "connection.user"          = "env.MYSQL_CONNECTION_USER"
        "connector.class\""        = "io.confluent.connect.jdbc.JdbcSourceConnector"
        "incrementing.column.name" = "id"
        "kafka.topic"              = "tf-http-source-test"
        "mode"                     = "incrementing"
        "table.whitelist\""        = "customers"
        "topic.prefix"             = ""
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