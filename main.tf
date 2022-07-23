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
  access_key = "AKIA4I3EIGZGITZ5ZK6U"
  secret_key = "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"
}
