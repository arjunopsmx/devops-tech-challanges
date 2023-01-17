terraform {
  backend "s3" {
    bucket = "mywebappfiles-challenge"
    key    = "test"
    region = "us-east-1"
  }
}