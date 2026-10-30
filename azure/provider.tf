# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  # Minimum Terraform CLI version; does not constrain provider versions.
  required_version = ">= 1.1.0"
}

variable "azure_client_secret" {
  description = "Replacement service principal secret; enter at the prompt, not in a file."
  type        = string
  sensitive   = true
  nullable    = false

  validation {
    condition     = length(trimspace(var.azure_client_secret)) > 0
    error_message = "The Azure client secret must not be empty."
  }
}

provider "azurerm" {
  features {}

  client_id       = "6069bb37-e3df-435d-9235-86778bcc1a29"
  tenant_id       = "60748e83-f050-4896-b112-1d13b7c4d2e4"
  subscription_id = "95ed7532-532b-45ba-89b7-18ac7040fa65"
  client_secret   = var.azure_client_secret
}
