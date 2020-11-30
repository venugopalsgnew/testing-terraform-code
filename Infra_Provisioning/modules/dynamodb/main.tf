terraform {
    required_version = ">= 0.12"
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraformdbtable3011"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
