locals {
  prefix = "poc-${terraform.workspace}"
  region = "eu-west-1"
  cidr = {
    dev  = "10.1.0.0/16"
    qa   = "10.10.0.0/16"
    prod = "10.100.0.0/16"
  }
  subnets = {
    public = [
      cidrsubnet(local.cidr[terraform.workspace], 4, 1),
      cidrsubnet(local.cidr[terraform.workspace], 4, 2),
      cidrsubnet(local.cidr[terraform.workspace], 4, 3)
    ]

    private = [
      cidrsubnet(local.cidr[terraform.workspace], 4, 4),
      cidrsubnet(local.cidr[terraform.workspace], 4, 5),
      cidrsubnet(local.cidr[terraform.workspace], 4, 6)
    ]

    database = [
      cidrsubnet(local.cidr[terraform.workspace], 4, 7),
      cidrsubnet(local.cidr[terraform.workspace], 4, 8),
      cidrsubnet(local.cidr[terraform.workspace], 4, 9)
    ]

  }

  tags = {
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Team        = "DevOps"
  }

}