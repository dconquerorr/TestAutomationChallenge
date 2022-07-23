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
  access_key = "AKIA4I3EIGZGGDN22YNE"
  secret_key = "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"
}
