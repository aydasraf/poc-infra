locals {
  prefix = "poc-${terraform.workspace}"
  repo_names = [
    {
      name = "url-shortener"
      team = "Kutt"
    }
  ]

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}