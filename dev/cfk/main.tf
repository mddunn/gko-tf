terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.26.0"
    }
  }
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = var.context
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = var.context
  }
}