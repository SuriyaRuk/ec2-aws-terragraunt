output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "public_dns" {
  value = aws_instance.this.public_dns
}

#output "eip" {
#  value = aws_eip.this.public_ip
#}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "private_dns" {
  value = aws_instance.this.private_dns
}

output "key_name" {
  value = aws_instance.this.key_name
}

output "subnet_id" {
  value = aws_instance.this.subnet_id
}

output "vpc_security_group_ids" {
  value = aws_instance.this.vpc_security_group_ids
}

output "availability_zone" {
  value = aws_instance.this.availability_zone
}

output "associate_public_ip_address" {
  value = aws_instance.this.associate_public_ip_address
}

output "root_block_device" {
  value = aws_instance.this.root_block_device
}

output "root_block_device_type" {
  value = aws_instance.this.root_block_device[0].volume_type
}

output "root_block_device_size" {
  value = aws_instance.this.root_block_device[0].volume_size
}
