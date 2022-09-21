output "getcampaign_invoke_arn" {
  value = "${aws_lambda_function.getcampaign.invoke_arn}"
}

output "createcampaign_invoke_arn" {
  value = "${aws_lambda_function.createcampaign.invoke_arn}"
}

