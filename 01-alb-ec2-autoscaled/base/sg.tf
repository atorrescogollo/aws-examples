module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.resource_name}-alb"
  description = "Security group for Load Balancer"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
      {
          rule = "all-all"
          cidr_blocks = "0.0.0.0/0"
      },
  ]
}



module "web_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.resource_name}-web"
  description = "Security group for Web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP ports"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_with_cidr_blocks = [
      {
          rule = "all-all"
          cidr_blocks = "0.0.0.0/0"
      },
  ]
}
