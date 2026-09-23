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
  #checkov:CKV_AWS_18:"Ensure the S3 bucket has access logging enabled"
  #checkov:CKV_AWS_144:"Ensure that S3 bucket has cross-region replication enabled"
  #checkov:CKV2_AWS_6:"Ensure that S3 bucket has a Public Access block"
  #checkov:CKV2_AWS_62:"Ensure S3 buckets should have event notifications enabled"
  #checkov:CKV_AWS_21:"Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:CKV2_AWS_61:"Ensure that an S3 bucket has a lifecycle configuration"

  tags = {
    Purpose = "github-actions-workshop"
  }
}