resource "helm_release" "confluent-operator" {
  name = "confluent-operator"
  repository = "https://packages.confluent.io/helm"
  chart = "confluent-for-kubernetes"
  version = "0.581.34"
  namespace = var.namespace

  set {
    name  = "licenseKey"
    value = var.licenseKey
  }

  depends_on = [
    kubernetes_namespace.cfk-ns
  ]
}