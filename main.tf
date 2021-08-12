terraform {
  #required_version = "~> 0.14.0"
  required_providers {
    aws = {
      #version = "<= 3.0.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVYN25GJQEURANKGL"
  secret_key = "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"
}

