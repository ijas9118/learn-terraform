terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-south-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "ijas-tf-test-bucket-12345"

  tags = {
    Name        = "My bucket 2.0"
    Environment = "Prod"
  }
}
