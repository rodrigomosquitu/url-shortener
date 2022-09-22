resource "aws_api_gateway_stage" "tfer--k25cdk06uc-002F-test" {
  cache_cluster_enabled = "false"
  deployment_id         = aws_api_gateway_deployment.deployment.id
  rest_api_id           = aws_api_gateway_rest_api.tfer_campaign_rest.id
  stage_name            = "test"
  xray_tracing_enabled  = "false"
}


