resource "aws_api_gateway_method" "tfer--k25cdk06uc-002F-eh1nmc-002F-GET" {
  api_key_required = "false"
  authorization    = "NONE"
  http_method      = "GET"

  request_parameters = {
    "method.request.path.shortid" = "true"
  }

  resource_id = aws_api_gateway_resource.shortid.id
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
}

resource "aws_api_gateway_method" "tfer--k25cdk06uc-002F-v0mdbf-002F-POST" {
  api_key_required = "false"
  authorization    = "NONE"
  http_method      = "POST"
  resource_id      = aws_api_gateway_resource.create.id
  rest_api_id      = aws_api_gateway_rest_api.tfer_campaign_rest.id
}
