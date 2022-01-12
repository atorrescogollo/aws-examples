#
# COMMON
#
variable "tags" {
  description = "Tags to apply to VPC and subnets"
  type        = map(string)
}
