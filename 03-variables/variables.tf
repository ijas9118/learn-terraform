variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"
}

variable "bucket_name" {
  description = "Base name for the S3 bucket"
  type        = string
  default     = "ijas-tf-test-bucket"
}
