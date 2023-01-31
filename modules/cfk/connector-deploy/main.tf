#export CONFLUENT_CLOUD_API_KEY="{KEY}"
#export CONFLUENT_CLOUD_API_SECRET="{SECRET}"

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}