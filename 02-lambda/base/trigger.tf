resource "aws_cloudwatch_event_rule" "every_five_minutes" {
  name                = "every-five-minutes"
  description         = "Fires every five minutes"
  schedule_expression = "rate(5 minutes)"
  tags                = var.tags
}

resource "aws_cloudwatch_event_target" "run_lambda" {
  target_id = "Run_test-lambda_every_five_minutes"
  rule      = aws_cloudwatch_event_rule.every_five_minutes.name
  arn       = module.lambda_function.lambda_function_arn
}
