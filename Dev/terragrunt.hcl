terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=4.0.0"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "aws" {
    region  = "eu-west-1"
  }
EOF
}

inputs = {
  name = "dev-instance-sg"
  vpc_id ="vpc-06ca958b2c32111f5"
  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Majedaar Security Group"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = {
    Name = "dev-instance-sg"
  }
}