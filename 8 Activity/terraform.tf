terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.35.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}