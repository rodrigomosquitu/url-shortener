resource "aws_dynamodb_table" "tfer--url-campaign" {
  attribute {
    name = "short_id"
    type = "S"
  }

  billing_mode = "PROVISIONED"
  hash_key     = "short_id"
  name         = "url-campaign-222"

  point_in_time_recovery {
    enabled = "false"
  }

  read_capacity    = "1"
  stream_enabled   = "true"
  stream_view_type = "NEW_AND_OLD_IMAGES"
  write_capacity   = "1"
}
