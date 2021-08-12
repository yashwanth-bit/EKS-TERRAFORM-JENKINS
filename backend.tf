terraform {
  backend "s3" {
    bucket = "yashwantheksproject"
    key    = "eks.tfstate"
    region = "us-east-1"
  }
}