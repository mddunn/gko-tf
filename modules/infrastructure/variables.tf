# ---------------------------------------------------------------------------------------------------------------------
# CC Environment and Cluster
# ---------------------------------------------------------------------------------------------------------------------
variable "env_name" {
  type = string
  description = "CC env display name"
  default = "demo-env"
  nullable = false
}

variable "cluster_name" {
  type = string
  description = "CC cluster display name"
  default = "demo-cluster"
  nullable = false
}

variable "cluster_availability" {
  type = string
  description = "Single or Multi zone"
  default = "SINGLE_ZONE"
  nullable = false

  validation {
    condition     = contains(["SINGLE_ZONE", "MULTI_ZONE"], var.cluster_availability)
    error_message = "Valid values are SINGLE_ZONE or MULTI_ZONE"
  }
}

variable "cluster_cloud" {
  type = string
  description = "CC CSP"
  default = "GCP"
  nullable = false

  validation {
    condition     = contains(["GCP", "AWS", "AZURE"], var.cluster_cloud)
    error_message = "Valid values are GCP, AWS or AZURE"
  }
}

variable "cluster_region" {
  type = string
  description = "CC CSP region"
  default = "us-west2"
  nullable = false
}

variable "sr_package" {
  type = string
  description = "Governance package"
  default = "ESSENTIALS"
  nullable = false

  validation {
    condition     = contains(["ESSENTIALS", "ADVANCED"], var.sr_package)
    error_message = "Valid values are ESSENTIALS and ADVANCED"
  }
}

variable "provisioning_sa" {
  type = string
  description = "CC TF provisioning SA"
  default = "demo-provisioning"
  nullable = false
}