resource "aws_api_gateway_integration_response" "tfer--k25cdk06uc-002F-eh1nmc-002F-GET-002F-301" {
  http_method = "GET"
  resource_id = aws_api_gateway_resource.shortid.id

  response_parameters = {
    "method.response.header.Location" = "integration.response.body.location"
  }

  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
  status_code = "301"

  depends_on = [
    aws_api_gateway_integration.tfer--k25cdk06uc-002F-eh1nmc-002F-GET,
    aws_api_gateway_method_response.tfer--k25cdk06uc-002F-eh1nmc-002F-GET-002F-301
  ]
}

resource "aws_api_gateway_integration_response" "tfer--k25cdk06uc-002F-v0mdbf-002F-POST-002F-200" {
  http_method = "POST"
  resource_id = aws_api_gateway_resource.create.id
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
  status_code = "200"

  depends_on = [
    aws_api_gateway_integration.tfer--k25cdk06uc-002F-v0mdbf-002F-POST,
    aws_api_gateway_method_response.tfer--k25cdk06uc-002F-v0mdbf-002F-POST-002F-200
  ]

}
