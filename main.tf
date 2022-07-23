terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  access_key = "AKIA4I3EIGZGCIIXFDKI"
  secret_key = "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"
}
