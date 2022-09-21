resource "aws_api_gateway_integration" "tfer--k25cdk06uc-002F-eh1nmc-002F-GET" {
  cache_namespace         = aws_api_gateway_resource.shortid.id
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "GET"
  integration_http_method = "POST"
  passthrough_behavior    = "NEVER"

  request_templates = {
    "application/json" = "{\r\n    \"short_id\": \"$input.params('shortid')\"\r\n}"
  }

  resource_id          = aws_api_gateway_resource.shortid.id
  rest_api_id          = aws_api_gateway_rest_api.tfer_campaign_rest.id
  timeout_milliseconds = "29000"
  type                 = "AWS"
  uri                  = var.aws_lambda_function_getcampaign_invoke_arn
}

resource "aws_api_gateway_integration" "tfer--k25cdk06uc-002F-v0mdbf-002F-POST" {
  cache_namespace         = aws_api_gateway_resource.create.id
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "POST"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_MATCH"
  resource_id             = aws_api_gateway_resource.create.id
  rest_api_id             = aws_api_gateway_rest_api.tfer_campaign_rest.id
  timeout_milliseconds    = "29000"
  type                    = "AWS_PROXY"
  uri                     = var.aws_lambda_function_createcampaign_invoke_arn
}
