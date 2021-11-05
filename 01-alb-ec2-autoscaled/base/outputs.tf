output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "alb_endpoint" {
  description = "Application Load Balancer endpoint"
  value = "http://${module.alb.lb_dns_name}/"
}
