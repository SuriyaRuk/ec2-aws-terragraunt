locals {
  region = "ap-southeast-1"
  profile = "v246"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
    region = "${local.region}"
    profile = "${local.profile}"
    skip_region_validation = true
  }
  EOF
}

terraform {
  source = "../../../modules/vpc"
}

inputs = {
  name                    = "duechat-dev"
  cidr_block             = "10.0.0.0/16"
  availability_zones     = ["ap-southeast-1a", "ap-southeast-1b"]
  public_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs   = ["10.0.10.0/24", "10.0.20.0/24"]
  enable_dns_hostnames   = true
  enable_dns_support     = true
  
  tags = {
    Environment = "dev"
    Project     = "bkc"
  }
}
