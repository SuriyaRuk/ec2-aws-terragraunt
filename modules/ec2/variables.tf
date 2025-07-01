variable "name" {
  description = "EC2 name"
  type        = string
  default     = "teragrunt-ec2"
}

variable "ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs"
  type        = list(any)
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associate public IP address"
  type        = bool
}


variable "private_ip" {
  description = "Private IP"
  type        = string
}

variable "root_block_device_type" {
  description = "Root block device type"
  type        = string
}

variable "root_block_device_size" {
  description = "Root block device size"
  type        = number
}

variable "root_block_device_encrypted" {
  description = "Root block device encrypted"
  type        = bool
}

variable "root_block_device_delete_on_termination" {
  description = "Root block device delete on termination"
  type        = bool
}

variable "root_block_device_iops" {
  description = "Root block device IOPS"
  type        = number
}
