resource "aws_iam_role" "tfer--lambda-dynamodb-create-campaign" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = [aws_iam_policy.tfer--AWSLambdaBasicExecutionRole-LOG_GROUP.arn, aws_iam_policy.tfer--AWSLambdaMicroserviceExecutionRole-DYNAMODB.arn]
  max_session_duration = "3600"
  name                 = "lambda-dynamodb-create-campaign-222"
  path                 = "/service-role/"
}