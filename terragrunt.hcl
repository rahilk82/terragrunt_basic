generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
 terraform {
  backend "s3" {
    bucket         = "rahil-account-terraform-state"
    key            = "Terragrunt/Dev/terraform.tfstate"
    dynamodb_table = "rahil-account-terraform-state-lock"
    region         = "eu-west-1"
  }
}
EOF
}