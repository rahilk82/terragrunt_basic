terraform {
  source = "tfr:///terraform-aws-modules/iam/aws//modules/iam-assumable-role?version=4.0.0"
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
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket         = "scalereal-pta-account-terraform-state"
    key            = "Session_Manager/terraform.tfstate"
    dynamodb_table = "scalereal-PTA-account-terraform-state-lock"
    encrypt        = "true"
    region         = "eu-west-1"
  }
}
EOF
}

inputs = {
  create_role = true
  role_name         = "ssm_policy_for_EC2"

  trusted_role_arns = [
    "arn:aws:iam::692204191322:root",
  ]

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  ]
}