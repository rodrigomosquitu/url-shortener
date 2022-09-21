resource "aws_lambda_function" "createcampaign" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "../zipados/createcampaign.zip"
  function_name = "createcampaign_222"
  role          = var.aws_iam_role_tfer_lambda_dynamodb_create_campaign_arn
  handler       = "index.handler"

  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }

  memory_size                    = "128"
  package_type                   = "Zip"
  timeout                        = "10"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("../zipados/createcampaign.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      CLOUDFRONT_URL = var.aws_cloudfront_distribution_cloudfront_domain_name
    }
  }
}

resource "aws_lambda_function" "getcampaign" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "../zipados/getcampaign.zip"
  function_name = "getcampaign_222"
  role          = var.aws_iam_role_tfer_lambda_dynamodb_create_campaign_arn
  handler       = "index.handler"

  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }

  memory_size                    = "128"
  package_type                   = "Zip"
  timeout                        = "10"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("../zipados/getcampaign.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}


resource "aws_lambda_permission" "allow_api_create" {
  statement_id  = "AllowAPIgatewayInvokation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.createcampaign.arn
  principal     = "apigateway.amazonaws.com"
}

resource "aws_lambda_permission" "allow_api_get" {
  statement_id  = "AllowAPIgatewayInvokation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.getcampaign.arn
  principal     = "apigateway.amazonaws.com"
}
