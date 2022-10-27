### Remote State
```powershell
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

###  Add a provisioner block
```sh

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  provisioner "local-exec" {
    command = "sudo apt install apache2"
  }
}
```