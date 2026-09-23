terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
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
  #checkov:skip=CKV_AWS_145:Ensure that S3 buckets are encrypted with KMS by default

  tags = {
    Purpose = "github-actions-workshop"
  }
}