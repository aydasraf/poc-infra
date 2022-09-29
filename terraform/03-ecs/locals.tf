locals {
  prefix        = "poc-${terraform.workspace}"

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}