resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-LOG_GROUP" {
  name = "AWSLambdaBasicExecutionRole-LOG_GROUP"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:*:*:log-group:/aws/lambda/*:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaMicroserviceExecutionRole-DYNAMODB" {
  name = "AWSLambdaMicroserviceExecutionRole-DYNAMODB"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:*:*:table/*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
