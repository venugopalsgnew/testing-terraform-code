provider "aws" {
    access_key = ""
    secret_key = ""
    region     = "ap-south-1"
}

module "webserver" {
    source          = "../modules/webserver"
    ami             = "ami-08f63db601b82ff5f"
    instance_type   = "t2.micro"
    env_name        = "dev"
    }

module "s3bucket" {
   source       = "../modules/s3"
   bucket_name  = "s3bucket30nov2020123"
}

module "dynamodb" {
   source       = "../modules/dynamodb"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "s3bucket30nov2020123"
    key            = "global/s3-dev/terraform.tfstate"
    region         = "ap-south-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraformdbtable3011"
    encrypt        = true
  }
}
    #this is for testing
