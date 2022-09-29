locals {
  prefix = "poc-${terraform.workspace}"
  repo_names = [
    {
      name = "url-shortener"
      team = "kutt"
    }
  ]

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}