# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  # Minimum Terraform CLI version; does not constrain provider versions.
  required_version = ">= 1.1.0"
}

provider "aws" {
  # Credentials: AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
  # Temporary credentials also require AWS_SESSION_TOKEN.
  region = "us-east-1"
}
