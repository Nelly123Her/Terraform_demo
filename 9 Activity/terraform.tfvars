ingress_rules = [{
  description = "Port 443"
  from_port   = 443,
  to_port     = 443,
  protocol    = "tcp",
  cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Port 80"
    from_port   = 80,
    to_port     = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"]
}]

egress_rules = [{
  description = ""
  from_port   = 0,
  to_port     = 0,
  protocol    = "-1",
  cidr_blocks = ["0.0.0.0/0"]
}]