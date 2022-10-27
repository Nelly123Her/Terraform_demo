provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "nic" {
  source    = "./modules/nic"
  subnet_id = module.subnet.subnet_id
}

module "ec2" {
  source = "./modules/ec2"
  network_interface_id = module.nic.network_interface_id
  subnet_id = module.subnet.subnet_id
  
}