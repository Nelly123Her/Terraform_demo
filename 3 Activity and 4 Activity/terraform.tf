terraform {
  backend "s3" {
    bucket = "terraformbucketmain"
    key    = "prod/aws_infra"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.35.0"
    }

  }
}

