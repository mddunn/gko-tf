resource "kubernetes_secret" "cloud-plain" {
  metadata {
    name      = "cloud-plain"
    namespace = var.namespace
  }
 data = {
    "plain.txt" = file("secrets/kafka-plain.txt")
  }
  type = "Opaque"
  depends_on = [
    data.kubernetes_namespace.cfk-ns
  ]
}

resource "kubernetes_secret" "cloud-sr-access" {
  metadata {
    name      = "cloud-sr-access"
    namespace = var.namespace
  }
 data = {
    "basic.txt" = file("secrets/sr-basic.txt")
  }
  type = "Opaque"
  depends_on = [
    data.kubernetes_namespace.cfk-ns
  ]
}

resource "kubernetes_secret" "connect-basic" {
  metadata {
    name      = "connect-basic"
    namespace = var.namespace
  }
  data = {
    "basic.txt" = file("secrets/connect-basic.txt")
  }
  type = "Opaque"
  depends_on = [
    data.kubernetes_namespace.cfk-ns
  ]
}

resource "kubernetes_secret" "connector-basic" {
  metadata {
    name      = "connector-basic"
    namespace = var.namespace
  }
  data = {
    "basic.txt" = file("secrets/connector-basic.txt")
  }
  type = "Opaque"
  depends_on = [
    data.kubernetes_namespace.cfk-ns
  ]
}