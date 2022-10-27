In this folder i've completed the 12 demos,
1. the first one creates a vpc on aws
```sh
resource "aws_vpc" "vpc_main" {
  provider         = aws
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }

}
```
2. The second one it creates a vpc but with a different path 
![alt text](./2%20Activity/proof.png)

3. The third one it uses a remote backend stores on s3 bucket
```sh
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
```
![alt text](./3%20Activity%20and%204%20Activity/Screen%20Shot%202022-10-19%20at%2012.12.32.png)

4. The fourth it creates a vpc resource using aws provider block
```sh

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

```

5. The fifth one creates an ec2 instance on aws
```sh
resource "aws_instance" "myec2" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

```

6. The sixth one uses modules, there are a vpc, nic, subnet an ec2 instance modules.

7. There is a cidr block validation to ensure the cidr block is correct
```sh
variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.cidr_block, 32))
    error_message = "Must be valid IPv4 CIDR."
  }
}
```
# Terraform_demo
