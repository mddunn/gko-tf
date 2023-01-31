resource "kubernetes_namespace" "cfk-ns" {
  metadata {
    name = var.namespace
  }
}