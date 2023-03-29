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
  name = "allow_tcp_rahil"
  vpc_id ="vpc-06ca958b2c32111f5"
  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["http-80-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = {
    Name = "Terragrunt Rahil: SG"
  }
}