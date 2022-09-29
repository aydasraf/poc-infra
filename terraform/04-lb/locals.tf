locals {
  prefix        = "poc-${terraform.workspace}"
  region        = "eu-west-1"
  states_bucket = "ayd-poc-tf-state"

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}