terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.26.0"
    }
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

provider "confluent" {
  # Specifying Cloud API Keys is still necessary for now when managing confluent_kafka_acl
  cloud_api_key       = var.confluent_cloud_api_key    # optionally use CONFLUENT_CLOUD_API_KEY env var
  cloud_api_secret    = var.confluent_cloud_api_secret # optionally use CONFLUENT_CLOUD_API_SECRET env var

  kafka_id            = var.kafka_id                   # optionally use KAFKA_ID env var
  kafka_rest_endpoint = var.kafka_rest_endpoint        # optionally use KAFKA_REST_ENDPOINT env var
  kafka_api_key       = var.kafka_api_key              # optionally use KAFKA_API_KEY env var
  kafka_api_secret    = var.kafka_api_secret           # optionally use KAFKA_API_SECRET env var
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