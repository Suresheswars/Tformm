terraform {
  backend "s3" {
    bucket         = "testbucketops"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    //dynamodb_table = "devopsteche"
  }
}