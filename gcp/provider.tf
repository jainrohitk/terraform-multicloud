# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  # Minimum Terraform CLI version; does not constrain provider versions.
  required_version = ">= 1.1.0"
}

variable "gcp_project_id" {
  description = "Google Cloud project ID in which to manage resources."
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.gcp_project_id)) > 0
    error_message = "The Google Cloud project ID must not be empty."
  }
}

variable "gcp_region" {
  description = "Default region for Google Cloud resources."
  type        = string
  default     = "us-central1"
  nullable    = false
}

provider "google" {
  # Set GOOGLE_APPLICATION_CREDENTIALS to an external service account JSON key file.
  project = var.gcp_project_id
  region  = var.gcp_region
}
