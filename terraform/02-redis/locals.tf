locals {
  prefix        = "poc-${terraform.workspace}"
  region        = "eu-west-1"
  states_bucket = "ayd-poc-tf-state"
  node_type = {
    dev  = "cache.t3.micro"
    qa   = "cache.t3.micro"
    prod = "cache.t3.micro"
  }

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}