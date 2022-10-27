variable "vpc_name" {
  default     = "VPC_Activity_9"
  description = "VPC"
}
variable "sg_name" {
  default = "sg_test"
}
variable "sg_description" {
  default = "This is my security group"

}



variable "ingress_rules" {
  description = "ingress rule"
  type = list(object({ description = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "egress rules with cidr_block"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}