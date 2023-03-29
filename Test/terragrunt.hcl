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
  ami           = "ami-0536352056b060629"
  instance_type = "t2.micro"
  tags = {
    Name = "Terragrunt Rahil: EC2"
  }
}