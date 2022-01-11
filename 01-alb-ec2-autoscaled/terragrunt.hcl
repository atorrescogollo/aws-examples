locals {
  env    = read_terragrunt_config("env.hcl").locals.env
  config = yamldecode(file(find_in_parent_folders("config.yaml")))
}

remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = local.config.tfstate_bucket
    key            = "${local.config.project_name}/${local.env}/terraform.tfstate"
    region         = local.config.region
    dynamodb_table = local.config.tfstate_bucket
  }
}

generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
        required_version = ">= 1"
        backend "s3" {}
    }
    provider "aws" {
        region = "${local.config.region}"
    }
    EOF
}
