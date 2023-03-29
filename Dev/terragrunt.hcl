terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=4.0.0"
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
  ami           = "ami-00aa9d3df94c6c354"
  instance_type = "t2.micro"
  tags = {
    Name = "Terragrunt Tutorial: EC2"
  }
}