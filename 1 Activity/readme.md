### Configure Multiple Providers and use each one to create some resources
```sh
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
```

## Different aliases

```sh
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "prod"
  region = "us-west-2"
}
```