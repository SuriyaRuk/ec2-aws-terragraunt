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
  source = "../../../modules/ssh-key"
}

inputs = {
  key_name   = "bkc-dev-key"
  public_key = file("~/.ssh/ed25519.pub")
  
  tags = {
    Environment = "dev"
    Project     = "bkc"
  }
}
