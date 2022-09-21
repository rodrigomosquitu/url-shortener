resource "aws_api_gateway_model" "tfer--21sda4" {
  content_type = "application/json"
  description  = "This is a default error schema model"
  name         = "Error222"
  rest_api_id  = aws_api_gateway_rest_api.tfer_campaign_rest.id
  schema       = "{\n  \"$schema\" : \"http://json-schema.org/draft-04/schema#\",\n  \"title\" : \"Error Schema\",\n  \"type\" : \"object\",\n  \"properties\" : {\n    \"message\" : { \"type\" : \"string\" }\n  }\n}"
}

resource "aws_api_gateway_model" "tfer--b56prn" {
  content_type = "application/json"
  description  = "This is a default empty schema model"
  name         = "Empty222"
  rest_api_id  = aws_api_gateway_rest_api.tfer_campaign_rest.id
  schema       = "{\n  \"$schema\": \"http://json-schema.org/draft-04/schema#\",\n  \"title\" : \"Empty Schema\",\n  \"type\" : \"object\"\n}"
}
