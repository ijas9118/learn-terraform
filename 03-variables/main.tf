resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Create S3 Bucket
resource "aws_s3_bucket" "demo" {
  # bucket = var.bucket_name
  bucket = local.full_bucket_name

  # tags = {
  #   Name        = "My bucket 2.0"
  #   Environment = var.environment
  # }
  tags = local.common_tags
}
