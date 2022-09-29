locals {
  domain_name = "aydasraf.link"

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}