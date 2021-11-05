resource "aws_iam_role" "ssm" {
  name = "ssm-${var.resource_name}"
  tags = var.tags

  assume_role_policy = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOT
}

resource "aws_iam_instance_profile" "ssm" {
  name = "ssm-${var.resource_name}"
  role = aws_iam_role.ssm.name
  tags = var.tags
}


resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ssm.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
