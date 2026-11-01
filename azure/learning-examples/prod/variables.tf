variable "location" {
  type     = string
  default  = "westus2"
  nullable = false
}

variable "enable_nic" {
  description = "Create an unattached private network interface."
  type        = bool
  default     = false
  nullable    = false
}
