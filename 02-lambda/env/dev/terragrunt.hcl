include {
  path = find_in_parent_folders()
}

locals {
  config = yamldecode(file(find_in_parent_folders("config.yaml")))
  env    = read_terragrunt_config("env.hcl").locals.env
}

terraform {
  source = "${get_terragrunt_dir()}/../..//base"
}

inputs = {
  tags = {
    project = local.config.project_name
    env     = local.env
  }
}
