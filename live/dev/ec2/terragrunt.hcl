
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
  source = "../../../modules/ec2"
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id                     = "vpc-mock"
    private_subnet_ids         = ["subnet-mock1", "subnet-mock2"]
    app_security_group_id     = "sg-mock"
  }
}

dependency "ssh_key" {
  config_path = "../ssh-key"
  mock_outputs = {
    key_name = "mock-key"
  }
}

inputs = {

  availability_zone = "ap-southeast-1a"
  private_ip = "10.0.1.5"
  ami = "ami-0a3ece531caa5d49d"
  instance_type = "m5dn.2xlarge"
  name = "bkc"
  tags = {
    Name = "bkc"
  }
  key_name = dependency.ssh_key.outputs.key_name
  vpc_security_group_ids = [dependency.vpc.outputs.app_security_group_id]
  subnet_id = dependency.vpc.outputs.public_subnet_ids[0]
  associate_public_ip_address = true

  root_block_device_size = "1024"
  root_block_device_type = "io1"
  root_block_device_iops = "40000" 
  root_block_device_delete_on_termination = true
  root_block_device_encrypted = false

}
