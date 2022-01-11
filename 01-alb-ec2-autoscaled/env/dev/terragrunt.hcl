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
  resource_name    = "${local.config.project_name}-${local.env}"
  cidr             = "10.10.0.0/16"
  azs              = ["${local.config.region}a", "${local.config.region}b", "${local.config.region}c"]
  private_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
  public_subnets   = ["10.10.11.0/24", "10.10.12.0/24"]
  min_size         = 2
  max_size         = 4
  desired_capacity = 2
  user_data        = <<-EOT
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd.x86_64
  sudo systemctl start httpd.service
  sudo systemctl enable httpd.service
  echo "Hello World from $(hostname -f)" | sudo tee /var/www/html/index.html
  EOT
  tags = {
    project = local.config.project_name
    env     = local.env
  }
}
