module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  name = "test-lambda"
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = module.sns_topic.sns_topic_arn
  protocol  = "email"
  endpoint  = "atorrescogollo@gmail.com"
}
