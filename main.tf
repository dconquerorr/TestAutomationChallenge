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
  access_key = "AKIA4I3EIGZGJVII6N4S"
  secret_key = "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"
}
