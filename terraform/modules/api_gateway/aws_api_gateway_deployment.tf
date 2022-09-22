resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id           = aws_api_gateway_rest_api.tfer_campaign_rest.id
  depends_on = [
    aws_api_gateway_method.tfer--k25cdk06uc-002F-eh1nmc-002F-GET,
    aws_api_gateway_method.tfer--k25cdk06uc-002F-v0mdbf-002F-POST,
    aws_api_gateway_integration_response.tfer--k25cdk06uc-002F-eh1nmc-002F-GET-002F-301,
    aws_api_gateway_integration_response.tfer--k25cdk06uc-002F-v0mdbf-002F-POST-002F-200,
    aws_api_gateway_integration.tfer--k25cdk06uc-002F-eh1nmc-002F-GET,
    aws_api_gateway_integration.tfer--k25cdk06uc-002F-v0mdbf-002F-POST,
    aws_api_gateway_method_response.tfer--k25cdk06uc-002F-eh1nmc-002F-GET-002F-301,
    aws_api_gateway_method_response.tfer--k25cdk06uc-002F-v0mdbf-002F-POST-002F-200,
    aws_api_gateway_resource.shortid,
    aws_api_gateway_resource.T,
    aws_api_gateway_resource.create
  ]
}
