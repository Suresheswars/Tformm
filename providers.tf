terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = "AKIAYNYJGFY7FMRDBMHI"
  secret_key = "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"
}
