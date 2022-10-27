terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.14.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.35.0"
    }

  }
}

