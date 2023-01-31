#export CONFLUENT_CLOUD_API_KEY="BVJR7Y4OB6CW6DXA"
#export CONFLUENT_CLOUD_API_SECRET="gVywH8SG4M0+NwBLHooZU/K5oQIEBg6r/RWn2O+SESYijAWGy5BVpruXfOQYc2pq"

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.context
}