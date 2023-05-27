terraform {
  backend "s3" {
    bucket         = "devopstechi"
    key            = "acc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devopsteche"
  }
}