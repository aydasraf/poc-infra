module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.0"

  name = "${local.prefix}-vpc"
  cidr = local.cidr[terraform.workspace]

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets  = local.subnets.private
  public_subnets   = local.subnets.public
  database_subnets = local.subnets.database


  create_database_subnet_group = true
  database_subnet_group_name   = "${local.prefix}-db-subnetgroup"

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_igw = true

  enable_nat_gateway = true
  single_nat_gateway = true


  tags = local.tags
}