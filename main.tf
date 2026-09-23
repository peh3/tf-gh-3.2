terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "tk/tf-gh-3.2"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = "tk-tf-gh-3.2"
  tags = {
    Purpose = "github-actions-workshop"
  }
}