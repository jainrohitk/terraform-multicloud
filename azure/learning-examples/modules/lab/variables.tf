variable "environment" {
  description = "Environment used in resource names and tags."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod."
  }
}

variable "location" {
  description = "Azure region for the lab."
  type        = string
  nullable    = false
}

variable "network_cidr" {
  description = "IPv4 CIDR for the lab virtual network."
  type        = string
  nullable    = false

  validation {
    condition     = can(cidrnetmask(var.network_cidr))
    error_message = "network_cidr must be a valid IPv4 CIDR."
  }
}

variable "subnets" {
  description = "Stable subnet names mapped to IPv4 CIDRs within network_cidr."
  type        = map(string)
  nullable    = false

  validation {
    condition     = contains(keys(var.subnets), "app") && alltrue([for cidr in values(var.subnets) : can(cidrnetmask(cidr))])
    error_message = "Subnets must include an app entry and contain valid IPv4 CIDRs."
  }
}

variable "enable_nic" {
  description = "Create an unattached private network interface in the app subnet."
  type        = bool
  default     = false
  nullable    = false
}

variable "tags" {
  description = "Additional non-secret tags; lab identity tags cannot be overridden."
  type        = map(string)
  default     = {}
  nullable    = false
}

locals {
  prefix = "tf-learning-${var.environment}"
  tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "Learning"
  })
}
