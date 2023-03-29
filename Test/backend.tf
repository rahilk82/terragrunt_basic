terraform {
  backend "s3" {
    bucket         = "rahil-account-terraform-state"
    key            = "Terragrunt/Test/terraform.tfstate"
    dynamodb_table = "rahil-account-terraform-state-lock"
    region         = "eu-west-1"
  }
}