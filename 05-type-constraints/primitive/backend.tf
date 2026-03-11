terraform {
  backend "s3" {
    bucket       = "infra-with-ijas-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
