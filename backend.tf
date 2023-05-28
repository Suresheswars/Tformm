terraform {
  backend "s3" {
    //bucket         = "devopstechi"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    //dynamodb_table = "devopsteche"
    access_key = "AKIAYNYJGFY7FMRDBMHI"
    secret_key = "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"
  }
}