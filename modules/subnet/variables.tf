variable "vpc_id" "this" {
  type = string
  description = "VPC ID"
}

variable "cidr_block" "this" {
  type = string
  description = "CIDR block"
}

variable "availability_zone" "this" {
  type = string
  description = "Availability zone"
}
