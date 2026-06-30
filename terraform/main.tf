provider "aws" {
  region = "eu-west-1"
}

resource "aws_dynamodb_table" "courses" {
  name         = "courses"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
