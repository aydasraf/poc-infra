locals {
  prefix        = "poc-${terraform.workspace}"
  region        = "eu-west-1"
  states_bucket = "ayd-poc-tf-state"
  instance_class = {
    dev  = "db.t4g.micro"
    qa   = "db.t4g.micro"
    prod = "db.t4g.micro"
  }


  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }
}