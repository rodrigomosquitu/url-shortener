resource "aws_iam_role_policy_attachment" "tfer--lambda-dynamodb-create-campaign_AWSLambdaBasicExecutionRole-LOG_GROUP" {
  policy_arn = aws_iam_policy.tfer--AWSLambdaBasicExecutionRole-LOG_GROUP.arn
  role       = aws_iam_role.tfer--lambda-dynamodb-create-campaign.name
}

resource "aws_iam_role_policy_attachment" "tfer--lambda-dynamodb-create-campaign_AWSLambdaMicroserviceExecutionRole-DYNAMODB" {
  policy_arn = aws_iam_policy.tfer--AWSLambdaMicroserviceExecutionRole-DYNAMODB.arn
  role       = aws_iam_role.tfer--lambda-dynamodb-create-campaign.name
}
