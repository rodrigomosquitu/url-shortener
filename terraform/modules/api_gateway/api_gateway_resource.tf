data "aws_api_gateway_resource" "raiz" {
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
  path        = "/"
}

resource "aws_api_gateway_resource" "shortid" {
  parent_id   = aws_api_gateway_resource.T.id
  path_part   = "{shortid}"
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
}

resource "aws_api_gateway_resource" "T" {
  parent_id   = data.aws_api_gateway_resource.raiz.id
  path_part   = "t"
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
}

resource "aws_api_gateway_resource" "create" {
  parent_id   = data.aws_api_gateway_resource.raiz.id
  path_part   = "create"
  rest_api_id = aws_api_gateway_rest_api.tfer_campaign_rest.id
}
