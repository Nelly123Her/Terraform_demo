### Create some resources

```sh

resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "vpc example"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"
  tags = {
    "Name" = "tf-example"
  }
}

resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["172.16.10.100"]
  tags = {
    "Name" = "primary_network_interface"
  }

}

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