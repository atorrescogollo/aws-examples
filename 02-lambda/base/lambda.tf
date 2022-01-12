module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "test-lambda"
  description   = "My awesome lambda function"
  handler       = "lambda.lambda_handler"
  runtime       = "python3.8"

  source_path = [
    {
      path             = "../src/lambda.py"
      pip_requirements = "../src/requirements.txt"
    }
  ]

  cloudwatch_logs_retention_in_days = 1

  allowed_triggers = {
    cron = {
      principal  = "events.amazonaws.com"
      source_arn = aws_cloudwatch_event_rule.every_five_minutes.arn
    }
  }
  # https://github.com/terraform-aws-modules/terraform-aws-lambda/issues/236
  create_current_version_allowed_triggers = false

  # https://github.com/terraform-aws-modules/terraform-aws-lambda/blob/master/examples/async/main.tf
  create_async_event_config = true
  attach_async_event_policy = true
  destination_on_failure    = module.sns_topic.sns_topic_arn
  destination_on_success    = module.sns_topic.sns_topic_arn

  tags = var.tags
}
