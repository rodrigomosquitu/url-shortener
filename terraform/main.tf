######################################################
# Terraform
######################################################
provider "aws" {}

terraform {
	required_providers {
		aws = {
	    version = "~> 4.31.0"
		}
  }
}

module "cloudfront" {
  source           = "./modules/cloudfront"
  region           = var.region
  aws_api_gateway_rest_api_tfer_campaign_rest_id = module.api_gateway.tfer_campaign_rest_id
}

module "api_gateway" {
  source           = "./modules/api_gateway"
  aws_lambda_function_getcampaign_invoke_arn = module.lambda.getcampaign_invoke_arn
  aws_lambda_function_createcampaign_invoke_arn = module.lambda.createcampaign_invoke_arn
}

module "lambda" {
  source           = "./modules/lambda"
  aws_iam_role_tfer_lambda_dynamodb_create_campaign_arn = module.iam.lambda_dynamodb_create_campaign_arn
  aws_cloudfront_distribution_cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
}

module "iam" {
  source = "./modules/iam"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}
