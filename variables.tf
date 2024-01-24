variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to connect to"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region to connect to"
  default     = "europe-west1"
}

variable "prefix" {
  type        = string
  description = "Optional. A prefix for the names of all resources created by this module"
  default     = null
}

variable "github_repository" {
  type        = string
  description = "The github repository to connect to GCP"
}

variable "github_token" {
  type        = string
  description = "The github token to authenticate with"
}
