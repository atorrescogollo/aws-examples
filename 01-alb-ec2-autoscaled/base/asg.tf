module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 4.0"

  # Autoscaling group
  name = var.resource_name

  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.public_subnets

  # Launch template
  lt_name                = var.resource_name
  description            = "Launch template for ASG ${var.resource_name}"
  update_default_version = true

  use_lt    = true
  create_lt = true

  image_id          = "ami-0ed961fa828560210"
  instance_type     = "t2.micro"
  user_data_base64  = base64encode(var.user_data)
  iam_instance_profile_arn = aws_iam_instance_profile.ssm.arn

  security_groups = [module.web_sg.security_group_id]
  target_group_arns = module.alb.target_group_arns

  tags_as_map = var.tags
}
