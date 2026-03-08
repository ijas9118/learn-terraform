output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.demo.arn
}

output "environment" {
  description = "Deployed environment"
  value       = var.environment
}

output "applied_tags" {
  description = "Tags applied to resources"
  value       = local.common_tags
}
