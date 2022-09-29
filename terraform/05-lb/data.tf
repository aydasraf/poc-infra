data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = local.region
    bucket = local.states_bucket
    key    = "env://${terraform.workspace}/vpc.tfstate"
  }
}

data "terraform_remote_state" "acm" {
  backend = "s3"

  config = {
    region = local.region
    bucket = local.states_bucket
    key    = "env://${terraform.workspace}/acm.tfstate"
  }
}