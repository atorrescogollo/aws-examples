module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.resource_name
  cidr = var.cidr

  azs = var.azs
  public_subnets  = var.public_subnets

  tags = var.tags
}
