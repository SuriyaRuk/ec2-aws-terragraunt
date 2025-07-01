

## Project Overview

This is a Terragrunt-based infrastructure-as-code project for deploying AWS resources. The project follows a modular architecture with reusable Terraform modules and environment-specific configurations using Terragrunt.

## Architecture

The codebase is organized into two main directories:

- **`modules/`**: Contains reusable Terraform modules for infrastructure components
  - `vpc/`: VPC with public/private subnets, internet gateway, route tables, and security groups
  - `ec2/`: EC2 instances with configurable block devices and networking
  - `ssh-key/`: SSH key pair management
  - `subnet/`: Standalone subnet module

- **`live/`**: Environment-specific Terragrunt configurations
  - `dev/`: Development environment configurations
  - `staging/`: Staging environment (structure only)
  - `prod/`: Production environment (structure only)

## Common Commands

### Terragrunt Operations
```bash
# Plan infrastructure changes
cd live/dev/<module>
terragrunt plan

# Apply infrastructure changes
terragrunt apply

# Destroy infrastructure
terragrunt destroy

# Format Terragrunt/Terraform files
terragrunt hclfmt

# Validate configuration
terragrunt validate
```

### Multi-module Operations
```bash
# Plan all modules in an environment
cd live/dev
terragrunt run-all plan

# Apply all modules in an environment
terragrunt run-all apply

# Destroy all modules in an environment
terragrunt run-all destroy
```

## Module Dependencies

The modules have the following dependency chain:
1. `ssh-key`: No dependencies
2. `vpc`: No dependencies
3. `ec2`: Depends on `vpc` and `ssh-key`

When working with the infrastructure, always deploy in dependency order: ssh-key → vpc → ec2.

## Configuration Details

- **AWS Region**: ap-southeast-1 (Singapore)
- **AWS Profile**: v246
- **VPC CIDR**: 10.0.0.0/16
- **Public Subnets**: 10.0.1.0/24, 10.0.2.0/24
- **Private Subnets**: 10.0.10.0/24, 10.0.20.0/24

## Security Groups

The VPC module creates an application security group with:
- SSH access (port 22) from anywhere (0.0.0.0/0)
- All outbound traffic allowed
- HTTP/HTTPS ports (80/443) are commented out but available for enabling

## EC2 Configuration

The EC2 instance is configured with:
- Instance type: m5dn.2xlarge
- Root volume: 1024GB io1 with 40,000 IOPS
- AMI: ami-0a3ece531caa5d49d
- Public IP association enabled
