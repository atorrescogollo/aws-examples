#
# COMMON
#
variable "resource_name" {
  description = "Resource names"
}

variable "tags" {
  description = "Tags to apply to VPC and subnets"
  type = map(string)
}

#
# VPC
#
variable "cidr" {
  description = "CIDR for VPC"
}

variable "azs" {
  description = "Availability zones for the subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "List of CIDRs for public subnets"
  type = list(string)
}

#
# AUTOSCALING GROUP
#
variable "min_size" {
  description = ""
  type = number
}

variable "max_size" {
  description = ""
  type = number
}

variable "desired_capacity" {
  description = ""
  type = number
}

variable "user_data" {
  description = ""
}
